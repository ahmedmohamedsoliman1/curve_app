import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              ) : Stack(
                alignment: Alignment.center,
                children: [
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: heightMediaQuery(height: 0.7, context: context),
                    child:  AlertDialog(
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10) ,
                        right: Radius.circular(20)),
                        side: BorderSide(color: AppColors.primaryColor ,
                        width: 1)
                      ),
                      elevation: 10,
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(image: AssetImage("assets/images/no_wifi.png") ,
                          width: 200, height: 200,) ,
                          SizedBox(
                            height: heightMediaQuery(height: 0.05, context: context),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppStrings.noInternet , style: TextStyle(
                                  fontSize: 18 , color: Colors.black ,
                                fontFamily: AppStrings.fontFamilyBold
                              ),),
                              SizedBox(width: 10,),
                              Icon(Icons.wifi_lock , color: AppColors.primaryColor , size: 25,)
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
