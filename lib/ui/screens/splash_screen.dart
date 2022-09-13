import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/ui/locator.dart';
import 'package:meeja/ui/screens/authentication_screens/login_screen.dart';
import 'package:meeja/ui/screens/main_screen/main_screen.dart';

import '../../core/services/auth_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthServices>();

  splashScreenDelay() async {
    ///
    /// splash screen delay
    ///
    await Future.delayed(Duration(seconds: 3));
    //  Get.offAll(() => LoginScreen());
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)));
    if (_authService.appUser.appUserId != null && _authService.isLogin!) {
        Get.offAll(() => MainScreen());
        print('User id=> ${_authService.appUser.appUserId}');

      }else if (_authService.appUser == null && !_authService.isLogin!) {

      Get.offAll(() => LoginScreen());
      print("App user name ${_authService.appUser.userName}");
      print("isLogin ${_authService.isLogin}");
    } else {

      Get.offAll(() => LoginScreen());
      print("User email ${_authService.appUser.userEmail}");
      print("isLogin ${_authService.isLogin}");
    }
  }


  @override
  void initState() {
    super.initState();
    splashScreenDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/meeja_icon.png', width: 106.36.w, height: 65.42.h,color: Colors.white,),
              SizedBox(height: 10.h),
              Image.asset('assets/images/meeja_text.png', width: 190.w, height: 21.61.h),
            ],
          ),
        ),
      ),
    );
  }
}
