import 'dart:async';

import 'package:curve_app/app/data/auth/registerResponseModel.dart';
import 'package:curve_app/app/modules/home/views/home_view.dart';
import 'package:curve_app/app/services/auth/auth_service.dart';
import 'package:curve_app/app/services/profile_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_strings.dart';
import '../../../../core/prefs.dart';
import '../../../../core/prefs_keys.dart';

class LoginRecoveryCodeRegisterController extends GetxController {

  var email = "" ;
  var token = "" ;
  AuthService service = AuthService();
  RxBool isLoading = false.obs ;
  var responseCode = 0;
  var formKeyRecoveryCodeView = GlobalKey<FormState>();
  RxBool isBtnActive = false.obs;
  TextEditingController firstInputController = TextEditingController();
  TextEditingController secondInputController = TextEditingController();
  TextEditingController thirdInputController = TextEditingController();
  TextEditingController lastInputController = TextEditingController();
  RegisterResponseModel currentUser = ProfileServices.currentUser;

  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 60;
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


  @override
  void onInit() {
    email = Get.arguments["email"];
    token = Get.arguments["token"] ;
    print(email);
    resetPasswordEmail();
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

  void resetPasswordEmail() async {
    isLoading.value = true;
    var response = await service.resetPasswordEmail(
      email: email,
    );

    if (response != null) {
      if (response.status == false) {
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
      } else if (response.status == true) {
        responseCode = response.code!;
        print(responseCode);
        isLoading.value = false;
        Get.snackbar(
          AppStrings.forgetPass,
          AppStrings.checkYourMail,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        startTimeout();
      } else if (response.message == "Too Many Attempts.") {
        isLoading.value = false;
        Get.snackbar(
          AppStrings.forgetPass,
          AppStrings.plsWait,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      }
    }
  }

  void checkCode() async{
    var inputCode = int.parse(firstInputController.text +
        secondInputController.text +
        thirdInputController.text +
        lastInputController.text);
    if (responseCode == inputCode) {
      currentUser = currentUser.copyWith(
        data: Data(
          city: currentUser.data!.city,
          country: currentUser.data!.country,
          governrate: currentUser.data!.governrate,
          platform: currentUser.data!.platform,
          updatedAt: currentUser.data!.updatedAt,
          phone: currentUser.data!.phone,
          email: currentUser.data!.email,
          createdAt: currentUser.data!.createdAt,
          id: currentUser.data!.id,
          name: currentUser.data!.name ,
          type: currentUser.data!.type ,
        ),
        token: token ,
        type: currentUser.data!.type ,
      );
      await Prefs.saveUser(key: PrefsKeys.currentUser, model: currentUser);
      print("user is : ${currentUser.toJson()}");
      Get.offAll(() => const HomeView());
    } else {
      Get.snackbar(
        AppStrings.forgetPass,
        AppStrings.codeEntered,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      );
    }
    update();
  }

}
