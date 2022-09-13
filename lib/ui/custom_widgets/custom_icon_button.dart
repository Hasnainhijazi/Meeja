import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/constants.dart';

class CustomIconButton extends StatelessWidget {

  final bool isSelected;
  final VoidCallback onPressed;
  final IconData icon;
  final String title;

  const CustomIconButton({required this.isSelected, required this.onPressed, required this.icon, required this.title});


  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        color: isSelected ? kPrimaryColor : kGrey1Color,
        icon: Column(
          children: [
            Icon(icon,size: 24.r),
            SizedBox(height: 4.h),
            Text(title,style: TextStyle(fontSize: 12.sp,color: isSelected ? kPrimaryColor : kGrey1Color),)
          ],
        ));
  }
}
