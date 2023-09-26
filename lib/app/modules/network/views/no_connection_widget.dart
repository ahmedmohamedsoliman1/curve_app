import 'package:curve_app/app/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_media_query.dart';
import '../../../core/app_strings.dart';

class NoConnevtionWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body:  Center(
        child: Container(
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
        ),
      ),
    );
  }
}