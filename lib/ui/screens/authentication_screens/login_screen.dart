import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/ui/custom_widgets/auth_button.dart';
import 'package:meeja/ui/custom_widgets/custom_check_box.dart';
import 'package:meeja/ui/custom_widgets/custom_auth_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/enums/view_State.dart';
import '../../custom_widgets/custom_app_bar.dart';
import 'authentication_screens_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthScreensProvider(),
      child: Consumer<AuthScreensProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(leading: false,haveActions: false,title: Text(
            'Login',
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
                    SizedBox(height: 32.34.h),
                    CustomAuthTextField(
                      title: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: model.emailController,
                      onChanged: (value){
                        model.appUser.userEmail = value;
                      },
                    ),
                    SizedBox(height: 32.h),
                    CustomAuthTextField(
                      title: 'Password',
                      controller: model.passwordController,
                      obscureText: model.hideLoginPassword,
                      showEye: true,
                      onEyeTap: model.toggleLoginEye,
                      onChanged: (value){
                        model.appUser.password = value;
                      },
                    ),
                    SizedBox(height: 19.5.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Checkbox(
                        //   value: false,
                        //   onChanged: (value) {},
                        //   activeColor: Colors.transparent,
                        //   checkColor: kPrimaryColor,
                        //   fillColor: null,
                        //   side: BorderSide(color: kPrimaryColor),
                        // ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                          child: CustomCheckBox(
                            value: model.rememberMeValue,
                            onChanged: model.rememberMe,
                          ),
                        ),

                        SizedBox(width: 8.w),

                        Text(
                          'Remember me',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        ),

                        Expanded(child: Row()),

                        Text(
                          'Lost your password?',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor),
                        )
                      ],
                    ),
                    SizedBox(height: 34.h),
                    AuthButton(
                      title: 'Login',
                      isRounded: true,
                      onPressed: () => model.login(model.appUser,context),
                    ),
                    SizedBox(height: 10.h),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: kGrey1Color,
                            fontFamily: 'Times-New-Roman'),
                        children: [
                          TextSpan(text: 'Haven’t any account? '),
                          TextSpan(
                              text: 'Signup',
                              style: TextStyle(color: kPrimaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = model.gotoSignup),
                        ],
                      ),
                    )
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

// AppBar(
// backgroundColor: kGrey3Color,
// centerTitle: true,
// elevation: 0.0,
// title: Text(
// 'Login',
// style: TextStyle(
// fontWeight: FontWeight.w700,
// fontSize: 26.sp,
// color: kBlackColor,
// ),
// ),
// )
