import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_app_demo/viewmodels/controllers/profile_controller.dart';
import 'package:social_app_demo/viewmodels/freezed/user_profile.dart';

import '../../core/errors/failure.dart';
import '../../models/services/auth.dart' as auth;
import '../../view/screens/home_screen.dart';

class AuthController extends GetxController {
  Map<String, String> _authInfo = {'userName': '', 'password': ''};
  final formKey = GlobalKey<FormState>();

  void updateUserName(String value) {
    _authInfo['userName'] = value;
  }

  void updatePassword(String value) {
    _authInfo['password'] = value;
  }

  Future<void> tryLogIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await _logIn();
    }
  }

  Future<void> _logIn() async {
    var result =
        await auth.logIn(_authInfo['userName']!, _authInfo['password']!);
    if (result is Right) {
      late UserProfile tempUser;
      result.fold((l) {}, (r) {
        tempUser = r;
      });
      ProfileController _profileController = Get.find();
      _profileController.setUser(tempUser);
      _profileController.getUsers();
      Get.off(HomeScreen());
    } else {
      Get.snackbar('auth erro', 'username or password is incorrect',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
