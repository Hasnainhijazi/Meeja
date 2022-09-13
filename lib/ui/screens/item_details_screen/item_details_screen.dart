import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/ui/custom_widgets/custom_button.dart';
import 'package:meeja/ui/custom_widgets/review_tile.dart';
import 'package:meeja/ui/screens/add_review_dialog/add_review_dialog.dart';

import '../../../core/models/item_details_model.dart';
import '../../custom_widgets/custom_app_bar.dart';
import '../../custom_widgets/item.dart';

class ItemDetailsScreen extends StatelessWidget {
  final ItemDetails item;
  ItemDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leadingIcon: IconlyLight.arrow_left),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor)),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      RichText(
                        text: TextSpan(
                          text: item.author,
                          style: TextStyle(
                              color: kBlackColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: kFontFamily),
                          children: [
                            TextSpan(
                                text: ' (Author)',
                                style: TextStyle(
                                    fontSize: 16.sp, color: kGrey1Color)),
                          ],
                        ),
                      ),

                      Container(
                        child: Row(
                          children: [
                            Text(
                              'Select',
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 5.w),
                            Icon(Icons.arrow_drop_down_sharp, size: 16),
                            SizedBox(width: 22.w)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: double.infinity.w,
                    height: 256.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill, image: AssetImage(item.filePath)),
                        borderRadius: kCircular26,),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: kBlackColor),
                  ),
                  ExpandableText(
                    item.description ?? '',
                    expandText: 'Learn more...',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: kGrey1Color,
                        height: 1.5.h),
                    linkStyle: TextStyle(fontWeight: FontWeight.w700),
                    linkColor: kPrimaryColor,
                    linkEllipsis: false,
                    animation: true,
                    maxLines: 4,
                    collapseOnTextTap: true,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onPressed: () {},
                        text: 'Add to Read',
                        color: kPrimaryColor,
                        fontSize: 12.sp,
                      ),
                      CustomButton(
                        onPressed: () {},
                        text: 'Recommend Item',
                        color: kPrimaryColor,
                        fontSize: 12.sp,
                      ),
                      Container(
                        padding: EdgeInsets.all(13.r),
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 24.r,
                                  color: Color(0xff000000).withOpacity(0.1),
                                  offset: Offset(0, 8))
                            ]),
                        child: Icon(
                          IconlyLight.chat,
                          size: 20.r,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text('Who have read?',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor)),
                  SizedBox(height: 12.h),
                ],
              ),
            ),

            Visibility(
              visible: item.usersRead != null,
              child: Container(
                height: 58.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: item.usersRead?.length ?? 0,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage(item.usersRead![index].profile),
                          radius: 20.r,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          item.usersRead![index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: kBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 32.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: kGrey1Color,
                          fontFamily: kFontFamily),
                      children: [
                        TextSpan(
                            text: 'Reviews ',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: kBlackColor)),
                        TextSpan(text: '('),
                        WidgetSpan(
                          child: Icon(
                            IconlyBold.star,
                            color: kPrimaryColor,
                            size: 20.r,
                          ),
                        ),
                        TextSpan(text: ' ${item.rating}%'),
                        TextSpan(text: ')'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor,
                          fontFamily: kFontFamily),
                      children: [
                        TextSpan(
                            text: 'Add Review',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.dialog(AddReviewDialog(),barrierDismissible: false);
                              }),
                        TextSpan(text: '   '),
                        TextSpan(text: 'See all'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            Visibility(
              visible: item.reviews != null,
              child: Container(
                height: 130.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: item.reviews?.length ?? 0,
                  itemBuilder: (context, index) =>
                      ReviewTile(review: item.reviews![index]),
                ),
              ),
            ),

            SizedBox(height: 32.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Similar Items',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                    ),
                  ),
                  Text('See all',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor,
                          fontFamily: kFontFamily)),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            Item(
              item: kExampleItems.firstWhere((newItem) => newItem.type == item.type),
              filter: item.type,
              showCurrentUsers: false,
            )
          ],
        ),
      ),
    );
  }
}
