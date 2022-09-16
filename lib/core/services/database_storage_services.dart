import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class DatabaseStorageServices{

  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadUserImage(File image,String uid) async{
    // final imagePath = image.path;
    try{
      var reference = _storage.ref().child("UsersProfileImages/$uid");
      var uploadImage = reference.putFile(image);
      TaskSnapshot snapshot = await uploadImage.whenComplete(() => print('Image Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    }catch(e){
      print("Exception@uploadUserImage=> $e");
      return null;
    }
  }

  Future<String?> uploadRecording(File file) async{
    // final imagePath = image.path;
    try{
      var reference = _storage.ref().child("Chats/Files/${DateTime.now().microsecondsSinceEpoch}");
      var uploadImage = reference.putFile(file,SettableMetadata(contentType: 'audio/wav'));
      TaskSnapshot snapshot = await uploadImage.whenComplete(() => print('Voice Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    }catch(e){
      print("Exception@voice upload=> $e");
      return null;
    }
  }


}