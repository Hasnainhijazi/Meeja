import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';

import '../../custom_widgets/custom_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: IconlyLight.arrow_left,
        title: Text('Chat',style: kAppBarTextStyle)
      ),
    );
  }
}
