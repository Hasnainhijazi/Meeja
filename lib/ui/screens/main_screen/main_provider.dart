import 'package:flutter/material.dart';
import 'package:meeja/ui/screens/connections_screen/connections_screen.dart';
import 'package:meeja/ui/screens/conversation_screens/message_screen.dart';
import 'package:meeja/ui/screens/profile_screens/profle_screen.dart';
import 'package:meeja/ui/screens/search_screen/search_screen.dart';

import '../home_screen/home_screen.dart';

class MainProvider extends ChangeNotifier{
  int pageIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    MessageScreen(),
    ConnectionsScreen(),
    ProfileScreen(),
  ];

  void gotoHome(){
    pageIndex = 0;
    notifyListeners();
  }

  void gotoSearch(){
    pageIndex = 1;
    notifyListeners();
  }

  void gotoChat(){
    pageIndex = 2;
    notifyListeners();
  }

  void gotoConnections(){
    pageIndex = 3;
    notifyListeners();
  }

  void gotoProfile(){
    pageIndex = 4;
    notifyListeners();
  }
}