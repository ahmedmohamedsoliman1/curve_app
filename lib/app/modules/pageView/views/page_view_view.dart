import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/login/views/login_view.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
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
      builder: (pageViewController) {
        return GetBuilder<NetworkController>(
            init: NetworkController(),
            builder: (controller) {
              return controller.connectivityStatus == 4 ||
                      controller.connectivityStatus == 1
                  ? SafeArea(
                      child: Scaffold(
                        backgroundColor: AppColors.whiteColor,
                        body: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: 0.08, context: context),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomButton(
                                      padding: 5,
                                      radius: 10,
                                      isShown: true,
                                      text: "تخطى",
                                      backgroundColor: AppColors.primaryColor,
                                      iconColor: AppColors.whiteColor,
                                      icon: Icons.arrow_forward_ios_outlined,
                                      onPressed: () {
                                        Get.off(() => LoginView());
                                      },
                                      textColor: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: 0.1, context: context),
                                ),
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: 0.3, context: context),
                                  child: PageView(
                                    controller: pageViewController.pageController,
                                    onPageChanged: (index) {
                                      pageViewController.equalPageIndex(
                                          index: index);
                                    },
                                    physics: const NeverScrollableScrollPhysics(),
                                    children: [
                                      PageViewWidget(
                                          image: "assets/images/first.png"),
                                      PageViewWidget(
                                          image: "assets/images/second.png"),
                                      PageViewWidget(
                                          image: "assets/images/third.png"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: 0.02, context: context),
                                ),
                                const Text(
                                  "شاشات ترحيبيه",
                                  style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 25,
                                      fontFamily: AppStrings.fontFamilyBold,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: 0.02, context: context),
                                ),
                                const Text(
                                  AppStrings.welcomeMessage,
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 16,
                                    fontFamily: AppStrings.fontFamilyMedium,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: 0.1, context: context),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => pageViewController.pageIndex != 0
                                          ? SizedBox(
                                              width: widthMediaQuery(
                                                  width: 0.32, context: context),
                                              child: GestureDetector(
                                                onTap: () {
                                                  pageViewController
                                                      .decreasePercent();
                                                  pageViewController
                                                      .iconTitle.value = "التالى";
                                                  pageViewController
                                                      .pageController
                                                      .animateToPage(
                                                          pageViewController
                                                                  .pageIndex -
                                                              1,
                                                          duration:
                                                              const Duration(
                                                                  seconds: 1),
                                                          curve: Curves.linear);
                                                },
                                                child: const Text(
                                                  //textDirection: TextDirection.ltr,
                                                  "السابق",
                                                  style: TextStyle(
                                                    color: AppColors.blackColor,
                                                    fontSize: 14,
                                                    fontFamily:
                                                        AppStrings.fontFamilyBold,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox(
                                              width: widthMediaQuery(
                                                  width: 0.32, context: context),
                                              child: Text(pageViewController
                                                  .nextButton.value),
                                            ),
                                    ),
                                    SmoothPageIndicator(
                                        controller:
                                            pageViewController.pageController,
                                        count: 3,
                                        axisDirection: Axis.horizontal,
                                        textDirection: TextDirection.ltr,
                                        effect: ScaleEffect(
                                            scale: 1.5,
                                            dotHeight: 10,
                                            dotWidth: 10,
                                            dotColor: AppColors.primaryColor,
                                            activeDotColor: Colors.grey.shade400,
                                            activePaintStyle:
                                                PaintingStyle.stroke,
                                            strokeWidth: 2)),
                                    SizedBox(
                                      width: widthMediaQuery(
                                          width: 0.2, context: context),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        pageViewController.increasePercent();
                                        pageViewController.pageController
                                            .animateToPage(
                                                pageViewController.pageIndex + 1,
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves.linear);
                                        pageViewController.changeTitle();
                                        if (pageViewController.pageIndex == 2) {
                                          Get.off(() => LoginView());
                                        }
                                      },
                                      child: CircularPercentIndicator(
                                        backgroundColor: Colors.white,
                                        radius: 40.0,
                                        lineWidth: 5.0,
                                        percent: pageViewController.percent,
                                        center: Obx(() => CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                                  AppColors.primaryColor,
                                              child: Text(
                                                pageViewController
                                                    .iconTitle.value,
                                                style: const TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 14,
                                                    fontFamily:
                                                        AppStrings.fontFamilyBold,
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
                        ),
                      ),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        SafeArea(
                          child: Scaffold(
                            backgroundColor: AppColors.whiteColor,
                            body: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: heightMediaQuery(
                                        height: 0.08, context: context),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomButton(
                                        padding: 5,
                                        radius: 10,
                                        isShown: true,
                                        text: "تخطى",
                                        backgroundColor: AppColors.primaryColor,
                                        iconColor: AppColors.whiteColor,
                                        icon: Icons.arrow_forward_ios_outlined,
                                        onPressed: () {
                                          Get.off(() => LoginView());
                                        },
                                        textColor: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: heightMediaQuery(
                                        height: 0.1, context: context),
                                  ),
                                  SizedBox(
                                    height: heightMediaQuery(
                                        height: 0.3, context: context),
                                    child: PageView(
                                      controller:
                                          pageViewController.pageController,
                                      onPageChanged: (index) {
                                        pageViewController.equalPageIndex(
                                            index: index);
                                      },
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        PageViewWidget(
                                            image: "assets/images/first.png"),
                                        PageViewWidget(
                                            image: "assets/images/second.png"),
                                        PageViewWidget(
                                            image: "assets/images/third.png"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightMediaQuery(
                                        height: 0.02, context: context),
                                  ),
                                  const Text(
                                    "شاشات ترحيبيه",
                                    style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 25,
                                        fontFamily: AppStrings.fontFamilyBold,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: heightMediaQuery(
                                        height: 0.02, context: context),
                                  ),
                                  const Text(
                                    AppStrings.welcomeMessage,
                                    style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 16,
                                      fontFamily: AppStrings.fontFamilyMedium,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: heightMediaQuery(
                                        height: 0.1, context: context),
                                  ),
                                  Row(
                                    textDirection: TextDirection.ltr,
                                    children: [
                                      Obx(
                                        () => pageViewController.pageIndex != 0
                                            ? SizedBox(
                                                width: widthMediaQuery(
                                                    width: 0.32,
                                                    context: context),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    pageViewController
                                                        .decreasePercent();
                                                    pageViewController.iconTitle
                                                        .value = "التالى";
                                                    pageViewController
                                                        .pageController
                                                        .animateToPage(
                                                            pageViewController
                                                                    .pageIndex -
                                                                1,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                  child: const Text(
                                                    //textDirection: TextDirection.ltr,
                                                    "السابق",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 14,
                                                      fontFamily: AppStrings
                                                          .fontFamilyBold,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                width: widthMediaQuery(
                                                    width: 0.32,
                                                    context: context),
                                                child: Text(pageViewController
                                                    .nextButton.value),
                                              ),
                                      ),
                                      SmoothPageIndicator(
                                          controller:
                                              pageViewController.pageController,
                                          count: 3,
                                          axisDirection: Axis.horizontal,
                                          textDirection: TextDirection.ltr,
                                          effect: ScaleEffect(
                                              scale: 1.5,
                                              dotHeight: 10,
                                              dotWidth: 10,
                                              dotColor: AppColors.primaryColor,
                                              activeDotColor:
                                                  Colors.grey.shade400,
                                              activePaintStyle:
                                                  PaintingStyle.stroke,
                                              strokeWidth: 2)),
                                      SizedBox(
                                        width: widthMediaQuery(
                                            width: 0.2, context: context),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          pageViewController.increasePercent();
                                          pageViewController.pageController
                                              .animateToPage(
                                                  pageViewController.pageIndex +
                                                      1,
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  curve: Curves.linear);
                                          pageViewController.changeTitle();
                                          if (pageViewController.pageIndex ==
                                              2) {
                                            Get.off(() => LoginView());
                                          }
                                        },
                                        child: CircularPercentIndicator(
                                          backgroundColor: Colors.white,
                                          radius: 40.0,
                                          lineWidth: 5.0,
                                          percent: pageViewController.percent,
                                          center: Obx(() => CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                child: Text(
                                                  pageViewController
                                                      .iconTitle.value,
                                                  style: const TextStyle(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 14,
                                                      fontFamily: AppStrings
                                                          .fontFamilyBold,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.transparent,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height:
                              heightMediaQuery(height: 0.7, context: context),
                          child: AlertDialog(
                            clipBehavior: Clip.antiAlias,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(10),
                                    right: Radius.circular(20)),
                                side: BorderSide(
                                    color: AppColors.primaryColor, width: 1)),
                            elevation: 10,
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image:
                                      AssetImage("assets/images/no_wifi.png"),
                                  width: 200,
                                  height: 200,
                                ),
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: 0.05, context: context),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppStrings.noInternet,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontFamily:
                                              AppStrings.fontFamilyBold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.wifi_lock,
                                      color: AppColors.primaryColor,
                                      size: 25,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
            });
      },
    );
  }
}
