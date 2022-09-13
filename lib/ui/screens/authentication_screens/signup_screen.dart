import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/ui/custom_widgets/auth_button.dart';
import 'package:meeja/ui/custom_widgets/custom_app_bar.dart';
import 'package:meeja/ui/custom_widgets/custom_check_box.dart';
import 'package:meeja/ui/screens/authentication_screens/authentication_screens_provider.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';
import '../../../core/enums/view_State.dart';
import '../../custom_widgets/custom_auth_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthScreensProvider(),
      child: Consumer<AuthScreensProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(leading: false,haveActions: false,title: Text(
            'Signup',
            style: kAppBarTextStyle,
          ),
          ),
          body: ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(color: kPrimaryColor),
            inAsyncCall: model.state == ViewState.busy,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Image.asset(
                      'assets/images/meeja_icon.png',
                      width: 76.69.w,
                      height: 47.1.h,
                    ),

                    SizedBox(height: 9.64.h),

                    Image.asset(
                      'assets/images/meeja_text.png',
                      width: 137.w,
                      height: 15.56.h,
                      color: kBlackColor,
                    ),

                    SizedBox(height: 30.h),

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
                              image: model.userImage == null
                                  ? null
                                  :DecorationImage(image: FileImage(model.userImage!),fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              color: kGrey2Color
                            ),
                          ),
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
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    CustomAuthTextField(
                      title: 'Full Name',
                      controller: model.fullNameController,
                      keyboardType: TextInputType.name,
                      onChanged: (value){
                        model.appUser.fullName = value;
                      },
                    ),

                    SizedBox(height: 32.h),

                    CustomAuthTextField(
                      title: 'Username',
                      controller: model.usernameController,
                      keyboardType: TextInputType.name,
                      onChanged: (value){
                        model.appUser.userName = value;
                      },
                    ),

                    SizedBox(height: 32.h),

                    CustomAuthTextField(
                      title: 'Email',
                      controller: model.emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        model.appUser.userEmail = value;
                      },
                    ),

                    SizedBox(height: 32.h),

                    CustomAuthTextField(
                      title: 'Password',
                      controller: model.passwordController,
                      obscureText: model.hideSignupPassword,
                      onEyeTap: model.toggleSignupEye,
                      showEye: true,
                      onChanged: (value){
                        model.appUser.password = value;
                      },
                    ),

                    SizedBox(height: 32.h),

                    CustomAuthTextField(
                      title: 'Confirm Password',
                      controller: model.confirmPasswordController,
                      obscureText: model.hideConfirmPassword,
                      onEyeTap: model.toggleConfirmEye,
                      showEye: true,
                      onChanged: (value){
                        model.appUser.confirmPassword = value;
                      },
                    ),

                    SizedBox(height: 16.h),

                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                          child: CustomCheckBox(
                            value: model.isAgreeTermsAndConditions,
                            onChanged: model.termsAndConditions,
                          ),
                        ),

                        SizedBox(width: 8.w),

                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,color: kGrey1Color,fontFamily: 'Times-New-Roman'),
                            children: <TextSpan>[
                              TextSpan(text: 'I accept the '),
                              TextSpan(text: 'Terms of Use',style: TextStyle(color: kPrimaryColor)),
                              TextSpan(text: ' & '),
                              TextSpan(text: 'Privacy Policy',style: TextStyle(color: kPrimaryColor)),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 32.h),

                    AuthButton(
                      title: 'Signup',
                      isRounded: false,
                      onPressed: () => model.signup(model.appUser,context),
                    ),

                    SizedBox(height: 19.h),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.sp,color: kGrey1Color,fontFamily: 'Times-New-Roman'),
                        children: [
                          TextSpan(text: 'Already have an account? '),
                          TextSpan(text: 'Login',style: TextStyle(color: kPrimaryColor),recognizer: TapGestureRecognizer()..onTap = model.gotoLogin),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
