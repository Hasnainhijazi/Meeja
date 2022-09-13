import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meeja/core/enums/view_State.dart';
import 'package:meeja/core/models/app_user.dart';
import 'package:meeja/core/services/auth_services.dart';
import 'package:meeja/core/services/database_services.dart';
import 'package:meeja/core/services/database_storage_services.dart';
import 'package:meeja/core/view_models/base_view_model.dart';

import '../../locator.dart';


class ProfileProvider extends BaseViewModal {
  AppUser appUser = AppUser();
  final locateUser = locator<AuthServices>();
  final formKey = GlobalKey<FormState>();
  XFile? image;
  File? userImage;
  String? imageUrl;
  String? editDescription;
  String? editName;
  String? editPhoneNumber;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  DatabaseServices databaseServices = DatabaseServices();

  ProfileProvider() {
    appUser = locateUser.appUser;
    nameController = TextEditingController(text: locateUser.appUser.userName!);
    phoneController = TextEditingController(text: locateUser.appUser.phoneNumber);
    descriptionController = TextEditingController(text: locateUser.appUser.description);
    print("AppUser email => ${appUser.userEmail}");
    print("AppUser Phone number => ${locateUser.appUser.phoneNumber}");
  }

  pickImageFromGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = File(image!.path);
      print("UserImagePath=>${userImage!.path}");
      notifyListeners();
    }
  }

  updateProfile(AppUser appUser) async {
    if (userImage != null) {
      setState(ViewState.busy);
      imageUrl = await databaseStorageServices.uploadUserImage(
          userImage!, locateUser.appUser.appUserId!);
      appUser.imageUrl = imageUrl;
      editName == null
          ? locateUser.appUser.userName!
          : appUser.userName = editName;
      editDescription == null
          ? locateUser.appUser.description!
          : appUser.description = editDescription;
      editPhoneNumber == null
          ? locateUser.appUser.phoneNumber!
          : appUser.phoneNumber = editPhoneNumber;
      await databaseServices.updateUserProfile(appUser);
      Get.snackbar(
        "Updated",
        "Your profile has been updated",
        snackPosition: SnackPosition.BOTTOM,
      );
      setState(ViewState.idle);
      print("User Image url=> $imageUrl");
      notifyListeners();
    } else if (userImage == null) {
      setState(ViewState.busy);
      // appUser.imageUrl = imageUrl;
      imageUrl == null ? locateUser.appUser.imageUrl! : appUser.imageUrl = imageUrl;
      editName == null ? locateUser.appUser.userName! : appUser.userName = editName;
      editDescription == null ? locateUser.appUser.description! : appUser.description = editDescription;
      editPhoneNumber == null ? locateUser.appUser.phoneNumber! : appUser.phoneNumber = editPhoneNumber;
      await databaseServices.updateUserProfile(appUser);
      Get.snackbar(
        "Updated",
        "Your profile has been updated",
        snackPosition: SnackPosition.BOTTOM,
      );
      setState(ViewState.idle);
      notifyListeners();
    }
  }

}
