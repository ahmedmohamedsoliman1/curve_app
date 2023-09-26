import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:curve_app/app/widgets/custom_elevated_button.dart';
import 'package:curve_app/app/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_strings.dart';

class ForgetPasswordView extends GetView {
  ForgetPasswordView({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
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
                    text: '',
                    icon: Icons.arrow_forward_ios_outlined,
                    onPressed: () {
                      Get.back();
                    },
                    textColor: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    backgroundColor: AppColors.primaryColor,
                    iconColor: AppColors.whiteColor,
                    fontSize: 16,
                    isShown: true,
                    radius: 5,
                    padding: 1,
                  ),
                ],
              ),
              Image.asset(
                'assets/images/logo.png',
                width: widthMediaQuery(width: .5, context: context),
                height: heightMediaQuery(height: .19, context: context),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                AppStrings.forgetPass,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontFamily: AppStrings.fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                AppStrings.entrePhoneNumber,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 13,
                  fontFamily: AppStrings.fontFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              customTextFormField(
                hint: AppStrings.phoneNumber,
                icon: Icons.phone,
                controller: controller,
                validator: (value) {},
                color: AppColors.blackColor,
                iconColor: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 60,
              ),
              CustomElevatedButton(
                onPressed: () {},
                btnText: AppStrings.next,
                btnBackgroundColor: AppColors.primaryColor,
                btnRadius: 12,
                textColor: AppColors.whiteColor,
                textFontSize: 14,
                textFontWeight: FontWeight.w500,
                btnPaddingHorizontal: .2,
                btnPaddingVertical: .02,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text(
                    AppStrings.rememberPassword,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.blackColor,
                        fontFamily: AppStrings.fontFamily),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
