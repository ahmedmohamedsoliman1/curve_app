import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../network/views/no_connection_widget.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return GetBuilder<NetworkController>(
            init: NetworkController(),
            builder: (controller) {
              return controller.connectivityStatus == 4 ||
                  controller.connectivityStatus == 1 ?
              SafeArea(
                child: Scaffold(
                  backgroundColor: AppColors.whiteColor,
                  body: Center(
                    child: Image.asset(
                      'assets/images/splash_logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ) : NoConnevtionWidget();
            });
      },
    );
  }
}
