import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';

PreferredSizeWidget CustomAppBar({
  IconData? leadingIcon,
  Widget? title,
  List<Widget>? actions,
  bool leading = true,
  bool haveActions = true})
=> AppBar(

  centerTitle: true,
  backgroundColor: kGrey3Color,
  elevation: 0.0,
  leading:  leading ? Padding(
    padding: const EdgeInsets.only(left: 16),
    child: GestureDetector(
      onTap: () {
        if(leadingIcon == IconlyLight.arrow_left){
          Get.back();
        }
      },
      child: Container(
        height: 44.h,
        width: 44.w,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
        ),
        child: Icon(
          leadingIcon ?? Icons.menu,
          color: Colors.black,
          size: 30.sp,
        ),
      ),
    ),
  ) : null,
  title: title ?? Column(
    children: [
      Image.asset(
        'assets/images/meeja_icon.png',
        width: 47.02.w,
        height: 28.78.h,
      ),
      SizedBox(height: 5.89.h),
      Image.asset(
        'assets/images/meeja_text.png',
        width: 84.w,
        height: 9.51.h,
        color: Colors.black,
      ),
    ],
  ),
  actions: haveActions ? actions ?? [
    Padding(
      padding: EdgeInsets.only(right: 27.w),
      child: Icon(
        Icons.notifications_active_outlined,
        color: kBlackColor,
      ),
    )
  ] : null,
);