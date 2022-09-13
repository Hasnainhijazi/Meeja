import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/core/models/review_model.dart';

class ReviewTile extends StatelessWidget {

  final Review review;
  const ReviewTile({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: kCircular20,
          boxShadow: [
            kBoxShadow
          ],
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage:
                AssetImage(review.reviewer.profile),
                radius: 16.r,
              ),
              SizedBox(width: 8.w),
              RichText(
                softWrap: false,
                maxLines: 2,
                text: TextSpan(
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: kFontFamily,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor),
                  children: [
                    TextSpan(text: review.reviewer.name),
                    TextSpan(text: '\n'),
                    WidgetSpan(
                        child: Icon(
                          IconlyBold.star,
                          color: kPrimaryColor,
                          size: 15.r,
                        )),
                    TextSpan(
                        text: review.value,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: kPrimaryColor))
                  ],
                ),
              ),
              Expanded(child: Container()),
              Text(
                review.time,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: kGrey1Color),
              )
            ],
          ),
          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 2,
                child: Text(
                  review.reviewText,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kBlackColor
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
