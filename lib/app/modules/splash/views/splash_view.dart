import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Image.asset(
          AppImages.splashLogo,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
