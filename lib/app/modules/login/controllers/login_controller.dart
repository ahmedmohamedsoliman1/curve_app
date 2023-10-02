import 'dart:async';

import 'package:curve_app/app/data/auth/registerResponseModel.dart';
import 'package:curve_app/app/services/auth/auth_service.dart';
import 'package:curve_app/app/services/profile_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var formKeyForLoginView = GlobalKey<FormState>();
  var formKeyForForgetPasswordView = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgetPasswordPhoneController = TextEditingController();
  AuthService service = AuthService();

  String type = "" ;
  bool isPressed = false ;

  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;
  int selectedIndex = 0;
  RegisterResponseModel user = ProfileServices.currentUser ;

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
    print("${user.data!.city} : city===========");
    print("${user.data!.governrate} : governarate================");
    print("${user.data!.country} : country================");
    print("${user.data!.type} : type=================");
    print("${user.data!.id} : id=====================");
    print("${user.data!.name} : name=====================");
    print("${user.data!.email} : email=====================");
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
