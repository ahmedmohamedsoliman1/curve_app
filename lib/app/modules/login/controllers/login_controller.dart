import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var formKeyForLoginView = GlobalKey<FormState>();
  var formKeyForForgetPasswordView = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgetPasswordPhoneController = TextEditingController();

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;
  int selectedIndex = 0 ;

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

  void onSelectedTabs(int index){
    selectedIndex = index ;
    print(selectedIndex);
    update();
  }
}
