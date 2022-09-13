import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/constants.dart';
import 'package:iconly/iconly.dart';

class CustomAuthTextField extends StatelessWidget {
  final controller;
  final String title;
  final obscureText;
  final keyboardType;
  final VoidCallback? onEyeTap;
  final onChanged;

  final bool? showEye;

  CustomAuthTextField({
    this.controller,
    required this.title,
    this.obscureText,
    this.keyboardType,
    this.onEyeTap,
    this.showEye,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),

        SizedBox(height: 8.h),

        TextField(
          obscureText: obscureText ?? false,
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.name,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 24.w, top: 15.h, bottom: 15.h),
            hintText: 'Input here...',
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: kGrey1Color,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
                borderRadius: kCircular30,
                borderSide: BorderSide(width: 1.0.w, color: kGrey2Color)),
            focusedBorder: OutlineInputBorder(
                borderRadius: kCircular30,
                borderSide: BorderSide(width: 1.0.w, color: kPrimaryColor)),

              suffixIcon:
            showEye ?? false ? obscureText?
              IconButton(
                icon: Icon(IconlyLight.hide,color: kBlackColor),
                onPressed: onEyeTap,
              ):
              IconButton(
                icon: Icon(IconlyLight.show,color: kBlackColor),
                onPressed: onEyeTap,
              ): null,
            suffixIconColor: kBlackColor
          ),
        ),
      ],
    );
  }
}
