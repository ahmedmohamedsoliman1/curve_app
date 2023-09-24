import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/login/views/login_view.dart';
import 'package:curve_app/app/modules/pageView/views/page_view_widget.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_media_query.dart';
import '../controllers/page_view_controller.dart';

class PageViewView extends GetView<PageViewController> {
  const PageViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageViewController>(
      init: PageViewController(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: heightMediaQuery(height: 0.08, context: context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        padding: 5,
                        radius: 10,
                        isShown: true,
                        text: "تخطى",
                        onPressed: () {
                          Get.off(() => const LoginView());
                        },
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ],
                ),
                SizedBox(
                  height: heightMediaQuery(height: 0.1, context: context),
                ),
                SizedBox(
                  height: heightMediaQuery(height: 0.3, context: context),
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.equalPageIndex(index: index);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      PageViewWidget(
                        image: "assets/images/first.png",
                      ),
                      PageViewWidget(image: "assets/images/second.png"),
                      PageViewWidget(image: "assets/images/third.png"),
                    ],
                  ),
                ),
                SizedBox(
                  height: heightMediaQuery(height: 0.02, context: context),
                ),
                Text(
                  "شاشات ترحيبيه",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 25,
                      fontFamily: AppStrings.fontFamilyBold,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: heightMediaQuery(height: 0.02, context: context),
                ),
                Text(
                  AppStrings.welcomeMessage,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontFamily: AppStrings.fontFamilyMedium,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: heightMediaQuery(height: 0.1, context: context),
                ),
                Row(
                  children: [
                    Obx(
                      () => controller.pageIndex != 0
                          ? SizedBox(
                              width: widthMediaQuery(
                                  width: 0.32, context: context),
                              child: InkWell(
                                  onTap: () {
                                    controller.decreasePercent();
                                    controller.iconTitle.value = "التالى" ;
                                    controller.pageController.animateToPage(
                                        controller.pageIndex-1,
                                        duration: const Duration(
                                          seconds: 1
                                        ),
                                        curve: Curves.linear);
                                  },
                                  child: Text("السابق",
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 14,
                                          fontFamily: AppStrings.fontFamilyBold,
                                          fontWeight: FontWeight.bold))),
                            )
                          : SizedBox(
                              width: widthMediaQuery(
                                  width: 0.32, context: context),
                              child: Text(controller.nextButton.value),
                            ),
                    ),
                    SmoothPageIndicator(
                        controller: controller.pageController,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        effect: ScaleEffect(
                            scale: 1.5,
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: AppColors.primaryColor,
                            activeDotColor: Colors.grey.shade400,
                            activePaintStyle: PaintingStyle.stroke,
                            strokeWidth: 2)),
                    SizedBox(
                      width: widthMediaQuery(width: 0.2, context: context),
                    ),
                    InkWell(
                      onTap: () {
                        controller.increasePercent();
                        controller.pageController.animateToPage(
                            controller.pageIndex + 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.linear);
                        controller.changeTitle();
                        if (controller.pageIndex == 2) {
                          Get.off(() => LoginView());
                        }
                      },
                      child: CircularPercentIndicator(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        lineWidth: 5.0,
                        percent: controller.percent,
                        center: Obx(() => CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.primaryColor,
                              child: Text(
                                controller.iconTitle.value,
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 14,
                                    fontFamily: AppStrings.fontFamilyBold,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        progressColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
