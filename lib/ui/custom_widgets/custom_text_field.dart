import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/constants.dart';

class CustomTextField extends StatelessWidget {
  final onChanged;
  final validator;
  final hintText;
  final controller;
  final preFixIcon;
  final sufFixIcon;
  final textInputAction;
  final keyBoardType;

  CustomTextField({
    this.preFixIcon,
    this.sufFixIcon,
    this.onChanged,
    this.controller,
    this.hintText,
    this.validator,
    this.textInputAction,
    this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: textInputAction,
        keyboardType: keyBoardType,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400),
        // style: Theme.of(context).textTheme.bodyText1!,
        decoration: InputDecoration(
          fillColor: Theme.of(context).cardColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          hintText: '$hintText',
          prefixIcon: Icon(
            preFixIcon,
            color: kPrimaryColor,
          ),
          suffixIcon: sufFixIcon != null
              ? ImageIcon(
                  AssetImage(sufFixIcon),
                  color: kPrimaryColor,
                )
              : SizedBox(
                  height: 0,
                  width: 0,
                ),
          border: OutlineInputBorder(
              borderRadius: kCircular30,
              borderSide: BorderSide(width: 1.0.w, color: kPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: kCircular30,
              borderSide: BorderSide(width: 1.0.w, color: kPrimaryColor)),
        ),
    );
  }
}

// TextField(
// obscureText: obscureText ?? false,
// controller: controller,
// keyboardType: keyboardType ?? TextInputType.name,
// onChanged: onChanged,
// decoration: InputDecoration(
// contentPadding:
// EdgeInsets.only(left: 24.w, top: 15.h, bottom: 15.h),
// hintText: 'Input here...',
// hintStyle: TextStyle(
// fontSize: 16.sp,
// color: kGrey1Color,
// fontWeight: FontWeight.w400,
// ),
// border: OutlineInputBorder(
// borderRadius: kCircular30,
// borderSide: BorderSide(width: 1.0.w, color: kGrey2Color)),
// focusedBorder: OutlineInputBorder(
// borderRadius: kCircular30,
// borderSide: BorderSide(width: 1.0.w, color: kPrimaryColor)),
//
// suffixIcon:
// showEye ?? false ? obscureText?
// IconButton(
// icon: Icon(IconlyLight.hide,color: kBlackColor),
// onPressed: onEyeTap,
// ):
// IconButton(
// icon: Icon(IconlyLight.show,color: kBlackColor),
// onPressed: onEyeTap,
// ): null,
// suffixIconColor: kBlackColor
// ),
// ),
