import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/core/models/item_details_model.dart';

import '../../core/enums/item_type.dart';
import '../screens/item_details_screen/item_details_screen.dart';

class Item extends StatelessWidget {
  
  final ItemDetails item;
  final ItemType filter;
  bool showCurrentUsers = true;
  Item({required this.item,required this.filter,required this.showCurrentUsers});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: filter == item.type || filter == ItemType.all,
      child: Padding(

        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 9.h,bottom: 7.h),

        child: GestureDetector(
          onTap: () => Get.to(()=>ItemDetailsScreen(item:item),preventDuplicates: false),
          child: Container(
            padding:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
                borderRadius: kCircular26,
                boxShadow: [
                  kBoxShadow
                ],
                color: Colors.white),
            child: Column(
              children: [

                Visibility(
                  visible: (item.currentlyReading.isNotEmpty && showCurrentUsers),
                  child: Row(
                    children: [


                      FlutterImageStack(
                        imageList: List.generate(item.currentlyReading.length, (index) => item.currentlyReading[index].profile),
                        imageSource: ImageSource.Asset,
                        totalCount: 6,
                        itemCount: 6,
                        itemBorderColor: Colors.white,
                        itemBorderWidth: 1.w,
                        showTotalCount: false,
                      ),


                      SizedBox(width: 12.w),

                      RichText(
                          text: TextSpan(
                            text: ((item.currentlyReading.length == 1) ?item.currentlyReading.first.name + ' is '
                                  :item.currentlyReading.length.toString() + ' Friends are '),
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w700,color: Color(0xff000000),fontFamily: kFontFamily),
                            children: [
                              TextSpan(
                                text: (item.type == ItemType.book)?'Reading':'Watching',
                                style: TextStyle(color: kPrimaryColor)
                              )
                            ]
                          ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12.h),

                Row(
                  children: [
                    Container(
                      height: 180.h,
                      width: 180.w,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      item.filePath),
                                  fit: BoxFit.cover),
                              borderRadius: kCircular16,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: 32.h,
                              padding:
                              EdgeInsets.only(top: 7.h, left: 12.w),
                              decoration: BoxDecoration(
                                color: kBlackColor.withOpacity(0.5),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    topRight: Radius.circular(16.r)),
                              ),
                              child: Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Container(
                        height: 180.h,
                        child: Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(IconlyBold.star,
                                      color: kPrimaryColor),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '${item.rating}%',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '${item.usersRead?.length ?? 0} users ${(item.type == ItemType.book)?'Read':'Watched'}',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                item.description ?? '',
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kGrey1Color,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
