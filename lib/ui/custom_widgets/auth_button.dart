import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/constants.dart';

class AuthButton extends StatelessWidget {

  final String title;
  final onPressed;
  final isRounded;

  AuthButton({super.key, required this.title, required this.onPressed,this.isRounded});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(isRounded ? 30.0.r: 0.0)),
        ),
        child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w700),)),
      ),
    );
  }
}