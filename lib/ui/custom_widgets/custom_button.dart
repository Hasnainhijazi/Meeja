import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  Color? textColor;
  double? fontSize;

  CustomButton(
      {required this.onPressed,
      required this.text,
      required this.color,
      this.textColor,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 11.h),
          decoration: BoxDecoration(
            color: color,
            borderRadius: kCircular30,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fontSize ?? 16.sp,
                fontWeight: FontWeight.w700,
                color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
