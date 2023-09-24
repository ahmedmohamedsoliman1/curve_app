import 'package:get/get.dart';

class SplashController extends GetxController {
  var increment = .33333333333333;

  void check() {
    increment += .33333333333333;
    if (increment >= 1.0) {
      increment = 0.0;
    }
    update();
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
}
