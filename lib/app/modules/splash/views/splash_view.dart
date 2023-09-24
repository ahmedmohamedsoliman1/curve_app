import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashView'),
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                controller.check();
              },
              child: CircularPercentIndicator(
                radius: 60.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 7.0,
                percent: controller.increment,
                center: CircleAvatar(
                  radius: 50,
                  child: Text('next'),
                  backgroundColor: Colors.yellow,
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.white,
                progressColor: Colors.yellow,
              ),
            );
          },
        ),
      ),
    );
  }
}
