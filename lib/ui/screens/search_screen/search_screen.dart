import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/ui/custom_widgets/custom_app_bar.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: IconlyLight.arrow_left,
        title: Text('Search', style: kAppBarTextStyle),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(IconlyLight.search,color: kGrey1Color,),
                contentPadding:
                    EdgeInsets.only(top: 15.h, bottom: 15.h),
                suffixIcon: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: kCircular30,
                    ),
                    child: Icon(IconlyLight.filter,color: Colors.white),
                ),
                hintText: 'Search here...',
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
                  borderSide: BorderSide(width: 1.0.w, color: kPrimaryColor),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: kCircular16,
                        boxShadow: [
                          kBoxShadow
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            height: 100.r,
                            width: 100.r,
                            decoration: BoxDecoration(
                              borderRadius: kCircular16,
                              image: DecorationImage(
                                image: AssetImage('$kImagesPath/book.png'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('The Psychology of Money',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kBlackColor)),

                              SizedBox(height: 4.h),

                              RichText(
                                text: TextSpan(
                                  text: 'Morgan Housal',
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: kFontFamily),
                                  children: [
                                    TextSpan(
                                        text: ' (Author)',
                                        style: TextStyle(
                                            fontSize: 12.sp, color: kGrey1Color)),
                                  ],
                                ),
                              ),

                              SizedBox(height: 12.h),

                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,fontFamily: kFontFamily,color: Colors.black),
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        IconlyBold.star,
                                        color: kPrimaryColor,
                                        size: 20.r,
                                      ),
                                    ),
                                    TextSpan(text: ' 100%'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: kCircular16,
                          boxShadow: [
                            kBoxShadow
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            height: 100.r,
                            width: 100.r,
                            decoration: BoxDecoration(
                                borderRadius: kCircular16,
                                image: DecorationImage(
                                    image: AssetImage('$kImagesPath/book.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('The Psychology of Money',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kBlackColor)),

                              SizedBox(height: 4.h),

                              RichText(
                                text: TextSpan(
                                  text: 'Morgan Housal',
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: kFontFamily),
                                  children: [
                                    TextSpan(
                                        text: ' (Author)',
                                        style: TextStyle(
                                            fontSize: 12.sp, color: kGrey1Color)),
                                  ],
                                ),
                              ),

                              SizedBox(height: 12.h),

                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,fontFamily: kFontFamily,color: Colors.black),
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        IconlyBold.star,
                                        color: kPrimaryColor,
                                        size: 20.r,
                                      ),
                                    ),
                                    TextSpan(text: ' 100%'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: kCircular16,
                          boxShadow: [
                            kBoxShadow
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            height: 100.r,
                            width: 100.r,
                            decoration: BoxDecoration(
                                borderRadius: kCircular16,
                                image: DecorationImage(
                                    image: AssetImage('$kImagesPath/book.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('The Psychology of Money',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kBlackColor)),

                              SizedBox(height: 4.h),

                              RichText(
                                text: TextSpan(
                                  text: 'Morgan Housal',
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: kFontFamily),
                                  children: [
                                    TextSpan(
                                        text: ' (Author)',
                                        style: TextStyle(
                                            fontSize: 12.sp, color: kGrey1Color)),
                                  ],
                                ),
                              ),

                              SizedBox(height: 12.h),

                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,fontFamily: kFontFamily,color: Colors.black),
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        IconlyBold.star,
                                        color: kPrimaryColor,
                                        size: 20.r,
                                      ),
                                    ),
                                    TextSpan(text: ' 100%'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: kCircular16,
                          boxShadow: [
                            kBoxShadow
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            height: 100.r,
                            width: 100.r,
                            decoration: BoxDecoration(
                                borderRadius: kCircular16,
                                image: DecorationImage(
                                    image: AssetImage('$kImagesPath/book.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('The Psychology of Money',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kBlackColor)),

                              SizedBox(height: 4.h),

                              RichText(
                                text: TextSpan(
                                  text: 'Morgan Housal',
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: kFontFamily),
                                  children: [
                                    TextSpan(
                                        text: ' (Author)',
                                        style: TextStyle(
                                            fontSize: 12.sp, color: kGrey1Color)),
                                  ],
                                ),
                              ),

                              SizedBox(height: 12.h),

                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,fontFamily: kFontFamily,color: Colors.black),
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        IconlyBold.star,
                                        color: kPrimaryColor,
                                        size: 20.r,
                                      ),
                                    ),
                                    TextSpan(text: ' 100%'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: kCircular16,
                          boxShadow: [
                            kBoxShadow
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            height: 100.r,
                            width: 100.r,
                            decoration: BoxDecoration(
                                borderRadius: kCircular16,
                                image: DecorationImage(
                                    image: AssetImage('$kImagesPath/book.png'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('The Psychology of Money',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: kBlackColor)),

                              SizedBox(height: 4.h),

                              RichText(
                                text: TextSpan(
                                  text: 'Morgan Housal',
                                  style: TextStyle(
                                      color: kBlackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: kFontFamily),
                                  children: [
                                    TextSpan(
                                        text: ' (Author)',
                                        style: TextStyle(
                                            fontSize: 12.sp, color: kGrey1Color)),
                                  ],
                                ),
                              ),

                              SizedBox(height: 12.h),

                              RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,fontFamily: kFontFamily,color: Colors.black),
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        IconlyBold.star,
                                        color: kPrimaryColor,
                                        size: 20.r,
                                      ),
                                    ),
                                    TextSpan(text: ' 100%'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
