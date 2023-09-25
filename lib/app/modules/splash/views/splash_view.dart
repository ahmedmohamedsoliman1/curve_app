import 'package:curve_app/app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Center(
            child: Image.asset(
              'assets/images/splash_logo.png',
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
