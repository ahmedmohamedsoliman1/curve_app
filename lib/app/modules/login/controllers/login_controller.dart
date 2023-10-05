import 'dart:async';

import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/core/prefs.dart';
import 'package:curve_app/app/core/prefs_keys.dart';
import 'package:curve_app/app/modules/home/views/home_view.dart';
import 'package:curve_app/app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/password_recovery_code_view.dart';

class LoginController extends GetxController {
  var formKeyForLoginView = GlobalKey<FormState>();
  var formKeyForForgetPasswordView = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController forgetPasswordPhoneController = TextEditingController();
  AuthService service = AuthService();
  bool isPressed = false;

  RxBool isLoading = false.obs;

  // RegisterResponseModel user = ProfileServices.currentUser;

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;
  int selectedIndex = 0;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}:'
      ' ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      print(timer.tick);
      currentSeconds = timer.tick;
      if (timer.tick >= timerMaxSeconds) timer.cancel();
      update();
    });
  }

  void loginWithEmailAndPassword() async {
    isLoading.value = true;
    var response = await service.login(
      email: emailController.text,
      password: passwordController.text,
    );
    if (response != null) {
      if (response.message == null) {
        isLoading.value = false;
        await Prefs.saveToken(
            key: PrefsKeys.token, token: response.token ?? '');
        Get.to(const HomeView());
      }
    } else {
      isLoading.value = false;
      Get.snackbar(
        AppStrings.completeLogin,
        AppStrings.plsEntreEmail,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      );
    }
  }

  void resetPasswordEmail() async {
    isLoading.value = true;
    var response = await service.resetPasswordEmail(
      email: emailController.text,
    );
    // if (response != null) {
    if (response?.message != null) {
      isLoading.value = false;
      Get.snackbar(
        AppStrings.forgetPass,
        AppStrings.checkYourMail,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      );
      Get.to(const PasswordRecoveryCodeView());
      // }
    } else {
      isLoading.value = false;
      Get.snackbar(
        AppStrings.forgetPass,
        AppStrings.emailIsNotCorrect,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      );
    }
  }

  void onChangedEmail(String inputEmail) {
    emailController.text = inputEmail;
    update();
  }

  void onChangedPassword(String inputPassword) {
    passwordController.text = inputPassword;
    update();
  }

  @override
  void onInit() {
    /*  print("${user.data!.city} : city===========");
    print("${user.data!.governrate} : governarate================");
    print("${user.data!.country} : country================");
    print("${user.data!.type} : type=================");
    print("${user.data!.id} : id=====================");
    print("${user.data!.name} : name=====================");
    print("${user.data!.email} : email=====================");*/
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSelectedTabs(int index) {
    isPressed = true;
    selectedIndex = index;
    print(selectedIndex);
    update();
  }
}
