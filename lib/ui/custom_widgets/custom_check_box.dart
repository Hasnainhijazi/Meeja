import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/constants.dart';

class CustomCheckBox extends StatelessWidget {

  final bool value;
  final VoidCallback onChanged;

  CustomCheckBox({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        height: 20.h,
        width: 20.w,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          border: Border.all(color: kPrimaryColor),
        ),
        child: Center(
          child: Visibility(
            visible: value,
              child: Icon(Icons.check,size: 15,color: kPrimaryColor,)),
        ),
      ),
    );
  }
}
