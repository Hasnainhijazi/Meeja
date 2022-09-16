import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/core/enums/message_type.dart';
import 'package:meeja/core/enums/view_State.dart';
import 'package:meeja/core/models/app_user.dart';
import 'package:meeja/ui/custom_widgets/message_bubble.dart';
import 'package:meeja/ui/screens/conversation_screens/message_provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final AppUser? toAppUser;

  ChatScreen({this.toAppUser});

  @override
  Widget build(BuildContext context) {
    return
        // ChangeNotifierProvider(
        // create: (context)=>MessageProvider(),
        // child:
        Consumer<MessageProvider>(
      builder: (context, model, child) {
        return ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            // backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              backgroundColor: kGrey2Color,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                      Get.back();
                  },
                  child: Container(
                    height: 44.h,
                    width: 44.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      IconlyLight.arrow_left,
                      color: Colors.black,
                      size: 30.sp,
                    ),
                  ),
                ),
              ),
              title: ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.all(0),
                leading: toAppUser!.imageUrl == null
                    ? CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/icons/profile_icon.png"),
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage("${toAppUser!.imageUrl}"),
                      ),
                title: Text(
                  "${toAppUser!.userName}",
                  style: kAppBarTextStyle,
                ),
              ),
            ),

            ///
            /// body
            ///
            body: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///
                  /// Messages
                  ///
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Conversations")
                        .doc(model.currentUser.appUser.appUserId)
                        .collection("Chats")
                        .doc(toAppUser!.appUserId!)
                        .collection("messages")
                        .orderBy('sentAt', descending: true)
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        // print(snapshot.data!.docs["messageText"]);
                        // return Text('message');

                        return Expanded(
                          child: ListView.builder(
                              reverse: true,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {

                                DocumentSnapshot doc =
                                    snapshot.data!.docs[index];


                                return MessageBubble(doc);

                              }),
                        );
                      } else {
                        return Text("No Messages found");
                      }
                    },
                  ),

                  ///
                  ///
                  // Expanded(
                  //   child: model.messages.isEmpty ? Center(child: Text('No Messages'),) : ListView.builder(
                  //       reverse: true,
                  //       itemCount: model.messages.length,
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           padding: EdgeInsets.symmetric(horizontal:15 ,vertical: 10),
                  //           child: Align(
                  //             alignment: (model.messages[index].sender == model.currentUser.appUser.appUserId ? Alignment.topRight : Alignment.topLeft),
                  //             child: Container(
                  //               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  //               decoration: textFiledContainerStyle.copyWith(color: model.messages[index].sender == model.currentUser.appUser.appUserId! ? primaryColor : Theme.of(context).backgroundColor),
                  //               child: Text(
                  //                 "${model.messages[index].messageText}",
                  //                 style: TextStyle(
                  //                   color: model.messages[index].sender != model.currentUser.appUser.appUserId! ? Theme.of(context).accentColor: Colors.white,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
                  ///
                  /// send message
                  ///
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                    child: Form(
                      key: model.formKey,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (value){
                                if(value == '') {
                                  model.setSendButton(false);
                                }else{
                                  model.setSendButton(true);
                                  model.conversation.messageText = value;
                                  model.conversation.type = MessageType.text;
                                }
                              },
                              style: TextStyle(fontSize: 16),
                              cursorColor: Colors.black,
                              controller: model.messageController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 17),
                                  hintText: "Message...",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                  ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: kPrimaryColor,width: 2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              shape: BoxShape.circle
                            ),
                            child: GestureDetector(
                              onTap: () async {

                                if(model.showSendButton){
                                  model.addMessages(toAppUser!.appUserId!,
                                      model.conversation, toAppUser!);
                                }else if(model.isRecording){
                                  var url = await model.stopRecording();
                                  print('hfhbhncsjbchjdcb');
                                  model.conversation.messageText = await url;
                                  model.conversation.type = MessageType.audio;
                                  model.addMessages(toAppUser!.appUserId!,
                                      model.conversation, toAppUser!);
                                }else{
                                  model.startRecording();
                                }

                                print("Sent to User :${toAppUser!.appUserId}");

                              },
                              child: Icon(
                                  model.showSendButton
                                      ? Icons.send
                                      : model.isRecording ? Icons.send_outlined : Icons.mic,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        );
      },
      // ),
    );
  }
}



// IconButton(
// constraints: const BoxConstraints(
// minWidth: 100,
// ),
// onPressed: () async {
// if (isPlaying) {
// await audioPlayer.pause();
// setState(() {
// isPlaying = false;
// });
// } else {
// await audioPlayer.play(UrlSource(message));
// setState(() {
// isPlaying = true;
// });
// }
// },
// icon: Icon(
// isPlaying ? Icons.pause_circle : Icons.play_circle,
// ),
// );
// })