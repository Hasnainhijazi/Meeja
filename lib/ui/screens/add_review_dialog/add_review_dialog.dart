import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';

import '../../custom_widgets/custom_button.dart';

class AddReviewDialog extends StatelessWidget {
  const AddReviewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
      EdgeInsets.symmetric(horizontal: 16.w),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 12.w, vertical: 15.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: kCircular26,),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 9.h),

              Text('Share your Review',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor)),

              SizedBox(height: 24.h),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      height: 40.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 11.h),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(
                                30.r)),
                        border: Border.all(
                            color: kGrey2Color),
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            'Followers',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight:
                                FontWeight.w700,
                                color: kGrey1Color),
                          ),
                          Icon(
                            IconlyLight.arrow_down_2,
                            color: kBlackColor,
                            size: 20.r,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      height: 40.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 11.h),
                      decoration: BoxDecoration(
                          borderRadius: kCircular30,
                          border: Border.all(
                              color: kGrey2Color)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            'Groups',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight:
                                FontWeight.w700,
                                color: kGrey1Color),
                          ),
                          Icon(
                            IconlyLight.arrow_down_2,
                            color: kBlackColor,
                            size: 20.r,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32.h),

              SliderTheme(
                data:
                SliderTheme.of(context).copyWith(
                  inactiveTrackColor: kGrey2Color,
                  activeTrackColor: kPrimaryColor,
                  thumbColor: kPrimaryColor,
                  overlayColor: Colors.white,
                  thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0),
                  overlayShape:
                  RoundSliderOverlayShape(
                      overlayRadius: 17.0),
                ),
                child: Slider(
                  value: 3,
                  min: 0,
                  max: 4,
                  divisions: 4,
                  onChanged: (double newValue) {},
                ),
              ),

              SizedBox(height: 32.h),

              TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.all(16.r),
                  hintText: 'Write here...',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: kGrey1Color,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: kCircular16,
                      borderSide: BorderSide(width: 1.0.w, color: kGrey2Color)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: kCircular16,
                      borderSide: BorderSide(width: 1.0.w, color: kPrimaryColor)),
                ),
              ),

              SizedBox(height: 24.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Expanded(
                    child: CustomButton(
                      onPressed: () => Get.back(),
                      text: 'Cancel',
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),

                  Expanded(
                    child: CustomButton(
                      onPressed: (){},
                      text: 'Submit',
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      clipBehavior: Clip.hardEdge,
    );
  }
}
