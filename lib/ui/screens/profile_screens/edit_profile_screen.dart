import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/core/enums/view_State.dart';
// import 'package:meeja/core/services/auth_services.dart';
import 'package:meeja/ui/custom_widgets/auth_button.dart';
import 'package:meeja/ui/custom_widgets/custom_app_bar.dart';
import 'package:meeja/ui/custom_widgets/custom_text_field.dart';
// import 'package:meeja/ui/locator.dart';
// import 'package:meeja/ui/screens/main_screen/main_screen.dart';
import 'package:meeja/ui/screens/profile_screens/profile_provider.dart';
// import 'package:meeja/ui/screens/profile_screens/profle_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class EditProfileScreen extends StatelessWidget {

  // final AppUser? appUser;
  //
  // EditProfileScreen({this.appUser});


  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, model, child) {
      return ModalProgressHUD(
        inAsyncCall: model.state == ViewState.busy,
        child: Scaffold(
          appBar: CustomAppBar(
            title: Text('Edit Profile',style: kAppBarTextStyle,),
            leadingIcon: IconlyLight.arrow_left,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
            child: Form(
              key: model.formKey,
              child: Column(
                children: [
                  ///
                  /// profile image
                  ///
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

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
                                    image: DecorationImage(
                                        image: model.locateUser.appUser.imageUrl != null
                                            ? NetworkImage(model.locateUser.appUser.imageUrl!)
                                            : model.userImage != null ? FileImage(model.userImage!) : AssetImage('assets/icons/profile_icon.png')  as ImageProvider,
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                    color: kGrey2Color
                                ),
                              ),

                              ///
                              /// Edit image
                              ///

                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: model.pickImageFromGallery,
                                  child: Container(
                                    height: 32.h,
                                    width: 32.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kPrimaryColor,
                                        border: Border.fromBorderSide(BorderSide(color: Colors.white))
                                    ),
                                    child: Icon(IconlyLight.camera,color: Colors.white,size: 20.r,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                              "${model.locateUser.appUser.userName}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              )),
                        ),
                        Container(
                          child: Text(
                              "${model.locateUser.appUser.userEmail}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.5,
                              )),
                        ),
                      ],
                    ),
                  ),


                  SizedBox(
                    height: 30,
                  ),

                  Column(
                    children: [
                      ///
                      /// username
                      ///
                      CustomTextField(
                        hintText: 'username',
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            model.editName = value;
                          }
                        },
                        preFixIcon: Icons.person,
                        controller: model.nameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      ///
                      /// phone number
                      ///
                      CustomTextField(
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            model.editPhoneNumber = value;
                          }
                        },
                        hintText: 'phone number',
                        preFixIcon: Icons.phone,
                        controller: model.phoneController,
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      ///
                      /// description
                      ///
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: kTextFiledContainerStyle.copyWith(
                            color: Theme.of(context).cardColor),
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              model.editDescription = value;
                            }
                          },
                          validator: (value) {},
                          controller: model.descriptionController,
                          maxLines: 7,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "Description",
                            // prefixIcon: Icon(Icons.info,color: Color(0xFF568C48)),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 0.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),


                      ///
                      /// Update profile
                      ///
                      AuthButton(
                        title: "Save",
                        isRounded: true,
                        onPressed: () async {
                          model.updateProfile(model.appUser);
                          // Navigator.pushReplacement(context, CustomPageRoute(child: ProfileScreen()),);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
