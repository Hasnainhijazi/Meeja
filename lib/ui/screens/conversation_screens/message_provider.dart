import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';
import 'package:meeja/core/enums/message_type.dart';
import 'package:meeja/core/models/app_user.dart';
import 'package:meeja/core/models/conversation.dart';
import 'package:meeja/core/services/auth_services.dart';
import 'package:meeja/core/services/database_services.dart';
import 'package:meeja/core/services/database_storage_services.dart';
import 'package:meeja/core/view_models/base_view_model.dart';
import 'package:meeja/ui/locator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/enums/view_State.dart';

class MessageProvider extends BaseViewModal {
  AppUser currentAppUser = AppUser();
  final formKey = GlobalKey<FormState>();
  bool showSendButton = false;
  List<AppUser> appUsers = [];
  List<AppUser> conversationUserList = [];
  DatabaseServices _databaseServices = DatabaseServices();
  final currentUser = locator<AuthServices>();
  final Conversation conversation = Conversation();
  List<Conversation> messages = [];
  final messageController = TextEditingController();
  Stream<QuerySnapshot>? getMessageStream;
  Stream<QuerySnapshot>? getConversationListStream;
  var onlyTime = DateFormat.jm();

  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  DatabaseServices databaseServices = DatabaseServices();

  FlutterSoundRecorder? _soundRecorder;
  FlutterSoundPlayer? _soundPlayer;
  bool isRecorderInit = false;
  bool isRecording = false;
  bool isPaused = false;
  bool isPlaying = false;

  MessageProvider() {
    _soundRecorder = FlutterSoundRecorder();
    currentAppUser = currentUser.appUser;
    getAppUsers();
    getUserConversationList();
    openAudio();
  }

  openAudio() async {
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw RecordingPermissionException('Mic permission not allowed');
    }
    _soundRecorder!.openRecorder();
    isRecorderInit = true;

    _soundPlayer = await FlutterSoundPlayer().openPlayer();
  }

  startRecording() async {

    if(!isRecording && isRecorderInit){
      await _soundRecorder!.deleteRecord(fileName: 'foo');
      await _soundRecorder!.startRecorder(toFile: 'foo');
      isRecording = true;
      notifyListeners();
    }
  }

  Future<String?> stopRecording() async {
    String? fileUrl;
    if(isRecording && isRecorderInit){
      var path = await _soundRecorder!.stopRecorder();

      setState(ViewState.busy);
      try{
        fileUrl = await databaseStorageServices.uploadRecording(File(path!));
      }catch(e){
        print(e);
      }
      setState(ViewState.idle);

      print(fileUrl);
      isRecording = false;
      notifyListeners();
      return fileUrl;
    }
    return null;
  }

  playAudio(String url)async{

    if(isPaused){
      await _soundPlayer!.resumePlayer();
      print('Voice resumed');
      isPaused = false;
    } else if(isPlaying){
      await _soundPlayer!.pausePlayer();
      print('Voice paused');
      isPaused = true;
    }else{
      await _soundPlayer!.startPlayer(
        fromURI: url,
        whenFinished: (){
          print('Voice ended');
          isPlaying = false;
          notifyListeners();
        },
      );
      isPlaying = true;
    }
    notifyListeners();
  }



  uploadRecording(File voice) async {
    setState(ViewState.busy);
    try{
      var fileUrl = await databaseStorageServices.uploadRecording(voice);
    }catch(e){
      print(e);
    }
    setState(ViewState.idle);
  }

  ///
  /// Get all app users
  ///
  getAppUsers() async {
    setState(ViewState.busy);
    appUsers = await _databaseServices.getAllAppUser();
    setState(ViewState.idle);
  }


  ///
  /// send text message
  ///
  addMessages(
      String toUserId, Conversation conversation, AppUser toAppUser) async {
    if (formKey.currentState!.validate()) {
      conversation.sentAt = DateTime.now().toString();
      toAppUser.createdAt = DateTime.now();
      // toAppUser.createdAt = DateTime.now().toString();
      conversation.sender = currentUser.appUser.appUserId!;
      toAppUser.lastMessage = conversation.messageText;
      currentAppUser.createdAt = DateTime.now();
      currentAppUser.lastMessage = conversation.messageText;
      currentAppUser.lastMessageAt = DateTime.now().toString();
      // toAppUser.createdAt = DateTime.now().toString();
      messageController.clear();
      setSendButton(false);
      await _databaseServices.addUserMessage(
          currentAppUser, toUserId, conversation, toAppUser);
      print(currentAppUser.lastMessage);
    }
  }

  // ///
  // /// Get user messages using stream
  // ///
  // getAllMessages(String toUserId) async{
  //   print("ToUserId => $toUserId");
  //   setState(ViewState.busy);
  //   getMessageStream =  _databaseServices.getRealTimeChat(currentUser.appUser.appUserId!, toUserId);
  //   getMessageStream!.listen((event) {
  //     messages = [];
  //     if(event.docs.length > 0){
  //       event.docs.forEach((element) {
  //         messages.add(Conversation.formJson(element, element.id));
  //         notifyListeners();
  //         print('Message from stream');
  //         print('Messages length ${messages.length}');
  //       });
  //      notifyListeners();
  //     }
  //     else{
  //       messages = [];
  //       notifyListeners();
  //     }
  //   });
  //   // messages = await _databaseServices.getAllMessages(currentUser.appUser.appUserId!, toUserId);
  //   setState(ViewState.idle);
  // }
  ///
  /// Get conversation list
  ///
  getUserConversationList() async {
    setState(ViewState.busy);
    getConversationListStream =
        _databaseServices.getUserConversationList(currentUser.appUser);
    getConversationListStream!.listen((event) {
      conversationUserList = [];
      if (event.docs.length > 0) {
        event.docs.forEach((element) {
          conversationUserList.add(AppUser.fromJson(element, element.id));
          notifyListeners();
        });
      }
    });
    setState(ViewState.idle);
  }

  setSendButton(bool value){
    showSendButton = value;
    notifyListeners();
  }

}
