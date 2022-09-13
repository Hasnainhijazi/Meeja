import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/ui/custom_widgets/auth_button.dart';
import 'package:meeja/ui/custom_widgets/custom_app_bar.dart';
import 'package:meeja/ui/screens/profile_screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_provider.dart';


class ProfileScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context,model,child) =>Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: Text('Profile',style: kAppBarTextStyle,),
          leadingIcon: IconlyLight.arrow_left,
        ),
        body:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///
                  /// Profile image
                  ///
                  Container(
                    width: 100.w,
                    height: 100.h,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              image: model.locateUser.appUser.imageUrl == null
                                  ? null
                                  :DecorationImage(image: NetworkImage(model.locateUser.appUser.imageUrl!),fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              color: kGrey2Color
                          ),
                        ),

                        ///
                        /// Edit image
                        ///

                        // Positioned(
                        //   bottom: 0,
                        //   right: 0,
                        //   child: GestureDetector(
                        //     onTap: model.pickImageFromGallery,
                        //     child: Container(
                        //       height: 32.h,
                        //       width: 32.w,
                        //       decoration: BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           color: kPrimaryColor,
                        //           border: Border.fromBorderSide(BorderSide(color: Colors.white))
                        //       ),
                        //       child: Icon(IconlyLight.camera,color: Colors.white,size: 20.r,),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    model.locateUser.appUser.userName ?? '',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: kBlackColor),
                  ),

                  SizedBox(height: 32.h),

                  ///
                  /// Profile details
                  ///
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.67,
                    child: Column(
                      children: [

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              color: kPrimaryColor,
                            ),
                            title: Text(
                              "${model.locateUser.appUser.userName}",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // trailing: Card(
                            //   child: Icon(
                            //     Icons.edit,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          ),
                        ),

                        SizedBox(height: 12.h),

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                          child: ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: kPrimaryColor,
                            ),
                            title: Text(
                              "${model.locateUser.appUser.phoneNumber}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                              ),
                            ),
                            // trailing: Card(
                            //   child: Icon(
                            //     Icons.edit,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          ),
                        ),

                        SizedBox(height: 12.h),

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                          child: ListTile(
                            leading: Icon(
                              Icons.info,
                              color: kPrimaryColor,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 5,
                              ),
                              child: Text(
                                "${model.locateUser.appUser.description}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 32.h),

                        ///
                        /// Edit profile button
                        ///

                        AuthButton(
                          title: 'Edit Profile',
                          isRounded: true,
                          onPressed: () {
                            Get.to( ()=> EditProfileScreen());
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
