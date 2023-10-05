import 'dart:async';
import 'package:curve_app/app/routes/app_pages.dart';
import 'package:curve_app/app/services/profile_services.dart';
import 'package:get/get.dart';
import 'package:curve_app/app/data/auth/registerResponseModel.dart';


class SplashController extends GetxController {

  RegisterResponseModel currentUser = ProfileServices.currentUser ;

  @override
  void onInit() {
    super.onInit();
    print(currentUser.token);
    Timer(const Duration(seconds: 3), () {
      if (currentUser.token != null){
        Get.offNamed(Routes.HOME);
      }else {
        Get.offNamed(Routes.PAGE_VIEW);
      }
    });
    update();
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

