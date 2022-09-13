import 'package:flutter/material.dart';
import 'package:meeja/constants.dart';
import '../custom_widgets/custom_app_bar.dart';

class ImageFullScreen extends StatelessWidget {
  final imageUrl;
  ImageFullScreen({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: false,
        haveActions: false,
        title: Text('Profile',style: kAppBarTextStyle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: imageUrl == null
            ? Image.asset('assets/icons/profile_icon.png')
            : Image.network(
          "$imageUrl",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
