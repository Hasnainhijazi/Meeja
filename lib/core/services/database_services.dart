import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeja/core/models/app_user.dart';
import 'package:meeja/core/services/auth_services.dart';
import 'package:meeja/ui/locator.dart';

class DatabaseServices{
  final firebaseFireStore = FirebaseFirestore.instance;
  // final currentAppUser = locator<AuthServices>();

  ///
  /// Add user
  ///
  registerUser(AppUser appUser) {
    try {
      firebaseFireStore
          .collection("AppUser")
          .doc(appUser.appUserId)
          .set(appUser.toJson());
    } catch (e) {
      print('Exception $e');
    }
  }

  ///
  /// Get user
  ///
  Future<AppUser> getUser(id) async {
    print('GetUser id: $id');
    try {
      final snapshot = await firebaseFireStore.collection('AppUser').doc(id).get();
      print('Current app User Data: ${snapshot.data()}');
      return AppUser.fromJson(snapshot.data(), snapshot.id);
    } catch (e) {
      print('Exception @DatabaseService/getUser $e');
      return AppUser();
    }
  }

  updateUserProfile(AppUser appUser) async {
    try {
      await firebaseFireStore
          .collection('AppUser')
          .doc(appUser.appUserId)
          .update(appUser.toJson());
    } catch (e) {
      print('Exception@UpdateUserProfile=>$e');
    }
  }

  ///
  /// get all app users
  ///
  Future<List<AppUser>> getAllAppUser() async {
    final List<AppUser> appUserList = [];
    try {
      QuerySnapshot snapshot = await firebaseFireStore.collection('AppUser').where("userEmail", isNotEqualTo: locator<AuthServices>().appUser.userEmail).where('makeProfilePrivate',isEqualTo: false).get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          appUserList.add(AppUser.fromJson(element, element.id));
          print("getUser => ${element['userName']}");
        });
      } else {
        print("No data found");
      }
    } catch (e) {
      print('Exception @DatabaseService/GetAllUsers $e');
    }
    return appUserList;
  }
  ///
  /// get all app users
  ///
  Future<List<AppUser>> getAppUsers() async {
    final List<AppUser> appUserList = [];
    try {
      QuerySnapshot snapshot = await firebaseFireStore.collection('AppUser').where('makeProfilePrivate',isEqualTo: false).get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((element) {
          appUserList.add(AppUser.fromJson(element, element.id));
          print("getUser => ${element['userName']}");
        });
      } else {
        print("No data found");
      }
    } catch (e) {
      print('Exception @DatabaseService/GetAllUsers $e');
    }
    return appUserList;
  }

  ///====================================///
  ///============== chat ===============///
  ///===================================///

  // addUserMessage(AppUser currentAppUser, String toUserId,
  //     Conversation conversation, AppUser toAppUser) async {
  //   try {
  //     // await firebaseFireStore.collection("Conversations").doc("$fromUserId").set(appUser.toJson());
  //     // await firebaseFireStore.collection("Conversations").doc("$fromUserId$toUserId").collection("Messages").add(conversation.toJson());
  //     ///
  //     /// From User message
  //     ///
  //     await firebaseFireStore
  //         .collection("Conversations")
  //         .doc("${currentAppUser.appUserId}")
  //         .collection("Chats")
  //         .doc("$toUserId")
  //         .collection("messages")
  //         .add(conversation.toJson());
  //     await firebaseFireStore
  //         .collection("Conversations")
  //         .doc("${currentAppUser.appUserId}")
  //         .collection("Chats")
  //         .doc("$toUserId")
  //         .set(toAppUser.toJson());
  //
  //     ///
  //     /// to user message
  //     ///
  //     await firebaseFireStore
  //         .collection("Conversations")
  //         .doc("$toUserId")
  //         .collection("Chats")
  //         .doc("${currentAppUser.appUserId}")
  //         .collection("messages")
  //         .add(conversation.toJson());
  //     await firebaseFireStore
  //         .collection("Conversations")
  //         .doc("$toUserId")
  //         .collection("Chats")
  //         .doc("${currentAppUser.appUserId}")
  //         .set(currentAppUser.toJson());
  //   } catch (e) {
  //     print('Exception@sentUserMessage$e');
  //   }
  // }
  //
  // ///
  // /// Get conversation users list
  // ///
  // Stream<QuerySnapshot>? getUserConversationList(AppUser appUser) {
  //   try {
  //     Stream<QuerySnapshot> snapshot = firebaseFireStore
  //         .collection("Conversations")
  //         .doc(appUser.appUserId)
  //         .collection("Chats")
  //         .orderBy('lastMessageAt', descending: false)
  //         .snapshots();
  //     return snapshot;
  //   } catch (e) {
  //     print('Exception@GetUserConversationList$e');
  //     return null;
  //   }
  // }
  //
  //
  // ///
  // /// Stream Messages
  // ///
  // ///
  //
  // Stream<QuerySnapshot>? getRealTimeChat(
  //     String currentUserId, String toUserId) {
  //   try {
  //     Stream<QuerySnapshot> messageSnapshot = firebaseFireStore
  //         .collection("Conversations")
  //         .doc(currentUserId)
  //         .collection("Chats")
  //         .doc(toUserId)
  //         .collection("messages")
  //         .orderBy('sentAt', descending: true)
  //         .snapshots();
  //     return messageSnapshot;
  //   } catch (e) {
  //     print('Exception@GetUserMessagesStream=>$e');
  //     return null;
  //   }
  // }

}