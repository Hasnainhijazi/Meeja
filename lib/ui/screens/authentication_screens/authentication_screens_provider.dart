import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
import 'package:meeja/core/models/app_user.dart';
import 'package:meeja/core/services/database_services.dart';
import 'package:meeja/core/services/database_storage_services.dart';
import 'package:meeja/core/view_models/base_view_model.dart';
import 'package:meeja/ui/screens/authentication_screens/login_screen.dart';
import 'package:meeja/ui/screens/authentication_screens/signup_screen.dart';
import 'package:meeja/ui/screens/main_screen/main_screen.dart';

import '../../../core/enums/view_State.dart';
import '../../../core/models/custom_auth_result.dart';
import '../../../core/services/auth_services.dart';
import '../../custom_widgets/custom_snack_bar.dart';
import '../../locator.dart';

class AuthScreensProvider extends BaseViewModal {
  final _authServices = locator<AuthServices>();
  final databaseServices = DatabaseServices();
  CustomAuthResult customAuthResult = CustomAuthResult();
  AppUser appUser = AppUser();
  XFile? image;
  File? userImage;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();

  bool rememberMeValue = false;
  bool hideLoginPassword = true;
  bool hideSignupPassword = true;
  bool hideConfirmPassword = true;
  bool isAgreeTermsAndConditions = false;

  rememberMe() {
    rememberMeValue = !rememberMeValue;
    notifyListeners();
  }

  termsAndConditions() {
    isAgreeTermsAndConditions = !isAgreeTermsAndConditions;
    print("Terms and conditions $isAgreeTermsAndConditions");
    notifyListeners();
  }

  gotoLogin() {
    Get.off(() => LoginScreen());
  }

  gotoSignup() {
    Get.off(() => SignupScreen());
  }

  toggleLoginEye() {
    hideLoginPassword = !hideLoginPassword;
    notifyListeners();
  }

  toggleSignupEye() {
    hideSignupPassword = !hideSignupPassword;
    notifyListeners();
  }

  toggleConfirmEye() {
    hideConfirmPassword = !hideConfirmPassword;
    notifyListeners();
  }

  ///
  /// Sign Up user
  ///
  signup(AppUser appUser, BuildContext context) async {
    // sign up user
    if (isAgreeTermsAndConditions) {
      print("User Name: ${appUser.userName}");
      print("User Email: ${appUser.userEmail}");
      print("User Password: ${appUser.password}");
      print("User ConfirmPassword: ${appUser.confirmPassword}");
      // appUser.isFirstLogin = true;
      setState(ViewState.busy);
      appUser.createdAt = DateTime.now();
      // appUser.monthYear = DateFormat("yMMM").format(DateTime.now());
      // appUser.lastJournalEntry = DateTime.now();
      // appUser.dayStreak = 0;
      // appUser.countTotalJournals = 0;
      // appUser.countJournalWords = 0;
      // appUser.session = 0;
      // appUser.twitterLink = '';
      // appUser.instagramLink = '';
      // appUser.facebookLink = '';
      // appUser.blockUser = false;
      // appUser.makeProfilePrivate = false;
      // appUser.accountabilitySession = 0;
      // appUser.growthSession = 0;
      // appUser.selfAwarenessSession = 0;
      // appUser.empowermentSession = 0;


      ///
      /// generate token
      ///
      // appUser.fcmToken = await FirebaseMessaging.instance.getToken();
      // appUser.lastMessageAt = DateTime.now();

      if (!emailController.text.contains('@')) {
        showSnackBar(context, 'Please enter valid email.');
      } else if (passwordController.text.length < 8) {
        showSnackBar(context, 'Password must be at least 8 characters long.');
        passwordController.clear();
        notifyListeners();
      } else if (passwordController.text != confirmPasswordController.text) {
        showSnackBar(context, 'Incorrect Password.');
        passwordController.clear();
        confirmPasswordController.clear();
        notifyListeners();
      } else {
        customAuthResult = await _authServices.signUpUser(appUser);

        if (customAuthResult.user != null) {

          ///
          /// Upload image
          ///
          if (userImage != null) {

            appUser.imageUrl = await databaseStorageServices.uploadUserImage(
                userImage!, customAuthResult.user!.uid);

            await databaseServices.updateUserProfile(appUser);

            _authServices.appUser = await databaseServices.getUser(customAuthResult.user!.uid);

            print("User Image url=> ${appUser.imageUrl}");

            notifyListeners();
          }

          print("SignUpUserId=> ${_authServices.appUser.appUserId}");
          Get.off(() => MainScreen());
        } else {
          showSnackBar(context, customAuthResult.errorMessage!);
        }

      }
      setState(ViewState.idle);




      // Get.defaultDialog(
      //   title: "Error Message",
      //   confirmTextColor: Colors.white,
      //   onConfirm: () {
      //     Navigator.pop(context);
      //   },
      //   content: Text(customAuthResult.errorMessage!),
      // );
    } else {
      showSnackBar(context, "You must agree to Terms and Conditions");
    }
    // Get.offAll(()=>WalkThroughScreen());
  }

  ///
  /// Login user
  ///
  login(AppUser appUser, BuildContext context) async {
    print("App user email: ${appUser.userEmail}");
    print("App user Password: ${appUser.password}");
    setState(ViewState.busy);

    ///
    /// generate token
    ///
    // appUser.fcmToken = await FirebaseMessaging.instance.getToken();

    // await databaseServices.updateUserProfile(appUser);

    if (!emailController.text.contains('@')) {
      showSnackBar(context, 'Please enter valid email.');
    } else if (passwordController.text.length < 8) {
      showSnackBar(context, 'Password must be at least 8 characters long.');
      passwordController.clear();
      notifyListeners();
    } else {
      customAuthResult = await _authServices.loginUser(appUser);

      setState(ViewState.idle);

      if (customAuthResult.user != null) {
        print("App user Id: ${_authServices.appUser.appUserId}");
        // print("Is first Login=> ${_authServices.appUser.isFirstLogin}");

        Get.off(() => MainScreen());
      } else {
        showSnackBar(
          context,
          "${customAuthResult.errorMessage!}",
          duration: 5000,
        );
      }
    }
    // Get.defaultDialog(
    //     title: "Error",
    //     content: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Text(
    //         "${customAuthResult.errorMessage!}",
    //       ),
    //     ),
    //     confirm: FlatButton(
    //       color: Color(0xFF568C48),
    //       onPressed: () {
    //         Get.back();
    //       },
    //       child: Text("OK", style: TextStyle(color: Colors.white)),
    //     ));
    ///////////
    // title: "Error Message",
    // confirmTextColor: Colors.white,
    // onConfirm: () {
    //   Navigator.pop(context);
    // },
    // content: Text(customAuthResult.errorMessage!),
    // );

    // Get.offAll(()=>WalkThroughScreen());
    // login
  }



  ///
  /// Pick image
  ///
  pickImageFromGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = File(image!.path);
      print("UserImagePath=>${userImage!.path}");
      notifyListeners();
    }
  }
}
