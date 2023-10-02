import 'dart:async';

import 'package:curve_app/app/services/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var formKeyForLoginView = GlobalKey<FormState>();
  var formKeyForForgetPasswordView = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgetPasswordPhoneController = TextEditingController();
  AuthService service = AuthService();

  String type = Get.arguments["type"] ?? "" ;
  bool isPressed = false ;

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
    var response = await service.login(
      email: emailController.text,
      password: passwordController.text,
      type: '',
    );
    if (response != null) {
      if (response.data != null) {
        print("okokokok");
      } else {
        print("false");
      }
    }
  }

  @override
  void onInit() {
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
    isPressed = true ;
    selectedIndex = index;
    print(selectedIndex);
    update();
  }
}
