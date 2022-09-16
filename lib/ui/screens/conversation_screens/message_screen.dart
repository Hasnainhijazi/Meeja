import 'package:flutter/material.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/core/enums/view_State.dart';
import 'package:meeja/ui/screens/conversation_screens/chat_screen.dart';
import 'package:meeja/ui/screens/conversation_screens/message_provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessageProvider(),
      child: Consumer<MessageProvider>(
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.white,
                ///
                /// AppBar
                ///
                appBar: AppBar(
                  bottom: TabBar(
                    labelPadding: EdgeInsets.all(10),
                    labelColor: Colors.black,
                    indicatorColor: Colors.black ,
                    labelStyle: TextStyle(fontSize: 14.sp),
                    tabs: [
                      Text("Messages"),
                      Text("All users"),
                    ],
                  ),
                  title: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                    child: Text('Chats',style: kAppBarTextStyle,),
                  ),
                  backgroundColor: kGrey3Color,
                  elevation: 0.0,
                  centerTitle: true,
                  // actions: [
                  //   IconButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context, CustomPageRoute(child: AllUsersScreen()));
                  //     },
                  //     icon: Icon(Icons.open_in_new_rounded, color: Colors.white,),
                  //   )
                  // ],
                ),

                ///
                /// Body
                ///
                body: TabBarView(
                  children: [
                    buildMessagesScreen(model, context),
                    buildAllUserScreen(model, context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildMessagesScreen(MessageProvider model, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        model.conversationUserList.isEmpty
            ? Center(
                child: Text("No Conversation found"),
              )
            : Expanded(
                child: ListView.separated(
                  itemCount:  model.conversationUserList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        trailing: Text("${model.onlyTime.format(model.conversationUserList[index].createdAt!)}"),

                        ///
                        /// User image
                        ///
                        leading: model.conversationUserList[index].imageUrl == null
                                ? CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: AssetImage(
                                        'assets/icons/profile_icon.png'),
                                  )
                                : CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: NetworkImage(
                                        '${model.conversationUserList[index].imageUrl}'),
                                  ),

                        ///
                        /// User name
                        ///
                        title: Text(
                            "${model.conversationUserList[index].userName}",
                        style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          "${model.conversationUserList[index].lastMessage}",
                          maxLines: 1,
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 11
                          ),
                        ),
                        onTap: () async {
                          print(model.conversationUserList[index].appUserId);
                          // await model.getAllMessages(model.conversationUserList[index].appUserId!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ChatScreen(
                                toAppUser: model.conversationUserList[index],
                              )));
                        },
                        tileColor: kGrey3Color,
                        // contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.0),
                      child: Divider(
                        thickness: 1,
                        color: kPrimaryColor,
                      ),
                    );
                  },
                ),
              )
      ],
    );
  }

  ///
  /// All app users
  ///
  buildAllUserScreen(MessageProvider model, BuildContext context) {
    return model.appUsers.isEmpty
        ? Center(child: Text("No users found"))
        : ListView.separated(
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.0),
                child: Divider(
                  thickness: 1,
                  color: kPrimaryColor,
                ),
              );
            },
            padding: EdgeInsets.symmetric(vertical: 5),
            itemCount: model.appUsers.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            tileColor: kGrey3Color,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            onTap: () async {
                              print(model.appUsers[index].appUserId);
                              // await model.getAllMessages(model.appUsers[index].appUserId!);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_)=>ChatScreen(
                                    toAppUser: model.appUsers[index],
                                  )));
                            },
                            leading: model.appUsers[index].imageUrl == null
                                ? CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: AssetImage(
                                        'assets/icons/profile_icon.png'),
                                  )
                                : CircleAvatar(
                                    radius: 30.r,
                                    // backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(
                                        '${model.appUsers[index].imageUrl}'),
                                  ),
                            title: Text(model.appUsers[index].userName!,style: TextStyle(fontSize: 14),),
                          ),
                        ),
                ],
              );
            },
          );
  }
}
