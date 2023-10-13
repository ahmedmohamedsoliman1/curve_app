import 'dart:async';

import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/core/prefs.dart';
import 'package:curve_app/app/core/prefs_keys.dart';
import 'package:curve_app/app/modules/home/views/home_view.dart';
import 'package:curve_app/app/modules/login/views/create_new_password_view.dart';
import 'package:curve_app/app/modules/login/views/login_view.dart';
import 'package:curve_app/app/services/auth/auth_service.dart';
import 'package:curve_app/app/services/profile_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/password_recovery_code_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var formKeyForLoginView = GlobalKey<FormState>();
  var formKeyForForgetPasswordView = GlobalKey<FormState>();
  var formKeyRecoveryCodeView = GlobalKey<FormState>();
  var formKeyCreateNewPassword = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController firstInputController = TextEditingController();
  TextEditingController secondInputController = TextEditingController();
  TextEditingController thirdInputController = TextEditingController();
  TextEditingController lastInputController = TextEditingController();
  AuthService service = AuthService();
  bool isPressed = false;
  RxBool isBtnActive = false.obs;
  RxBool isLoading = false.obs;
  int selectedIndex = 0;
  var responseCode = 0;
  FirebaseAuth auth =  FirebaseAuth.instance ;
  // RegisterResponseModel user = ProfileServices.currentUser;

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
        Get.off(() => const HomeView());
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
            Icons.error,
            color: Colors.red,
          ),
        );
        Get.to(() => PasswordRecoveryCodeView());
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


  void checkCode() {
    var inputCode = int.parse(firstInputController.text +
        secondInputController.text +
        thirdInputController.text +
        lastInputController.text);
    if (responseCode == inputCode) {
      Get.off(() => const CreateNewPasswordView());
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

  void setNewPassword() async {
    isLoading.value = true;
    var response = await service.setNewPassword(
      email: emailController.text,
      password: passwordController.text,
      code: int.parse(firstInputController.text +
          secondInputController.text +
          thirdInputController.text +
          lastInputController.text),
      method: 'PUT',
    );
    print(response);
    if (response != null) {
      if (response.status == true) {
        isLoading.value = false;
        Get.snackbar(
          AppStrings.createNewPassword,
          AppStrings.updatedSuccessfully,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
        Get.to(() => LoginView());
      } else if (response.errors?.password?[0] ==
          "The password field must be at least 8 characters.") {
        isLoading.value = false;
        Get.snackbar(
          AppStrings.createNewPassword,
          AppStrings.numOfPassword,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      } else if (response.message ==
          "No query results for model [App\\Models\\PasswordReset].") {
        isLoading.value = false;
        Get.snackbar(
          AppStrings.createNewPassword,
          AppStrings.codeEntered,
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
    print('///////////////////////////////////////');

    print('///////////////////////////////////////');
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
    emailController.text;
    startTimeout();
    super.onClose();
  }

  void onSelectedTabs(int index) {
    isPressed = true;
    selectedIndex = index;
    print(selectedIndex);
    update();
  }

    Future signInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

          if (googleUser == null){
            return ;
          }
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseAuth auth = FirebaseAuth.instance;
      print(auth.currentUser!.uid);
      await Prefs.saveGoogleUser(key: PrefsKeys.googleCurrentUser,
          model: {
            "userName" : auth.currentUser!.displayName ,
            "userId" : auth.currentUser!.uid ,
            "userEmail" : auth.currentUser!.email ,
            "userEmailVerified" : auth.currentUser!.emailVerified ,
            "userPhone" : auth.currentUser!.phoneNumber ,
            "userToken" : auth.currentUser!.refreshToken
          });
      print("saved");
      Get.offAll(()=>const HomeView());
      // await Prefs.saveGoogleUser(key: PrefsKeys.googleCurrentUser, model: user!);
      // print("saved");
    }


}
