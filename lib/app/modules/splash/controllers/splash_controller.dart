import 'dart:async';
import 'package:curve_app/app/routes/app_pages.dart';
import 'package:curve_app/app/services/profile_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:curve_app/app/data/auth/registerResponseModel.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SplashController extends GetxController {

  RegisterResponseModel currentUser = ProfileServices.currentUser ;
  FirebaseAuth auth =  FirebaseAuth.instance ;

  @override
  void onInit() {
    super.onInit();
    print(auth.currentUser?.uid);
    Timer(const Duration(seconds: 3), () {
      if (auth.currentUser != null){
        if (auth.currentUser?.uid != null){
          Get.offNamed(Routes.HOME);
        }
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

