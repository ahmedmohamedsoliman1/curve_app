import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/login/controllers/login_controller.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:curve_app/app/widgets/custom_elevated_button.dart';
import 'package:curve_app/app/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordView extends GetView {
  const CreateNewPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
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
                      AppStrings.createNewPassword,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 17,
                        fontFamily: AppStrings.fontFamilyBold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      AppStrings.pleaseEntreNewPassword,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 13,
                        fontFamily: AppStrings.fontFamilyMedium,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    customTextFormField(
                      hint: AppStrings.password,
                      obscure: true,
                      icon: Icons.lock,
                      iconColor: AppColors.primaryColor,
                      controller: controller.passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      color: AppColors.blackColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    customTextFormField(
                      hint: AppStrings.confirmPassword,
                      obscure: true,
                      icon: Icons.lock,
                      iconColor: AppColors.primaryColor,
                      controller: controller.passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      color: AppColors.blackColor,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomElevatedButton(
                      onPressed: () {},
                      btnText: AppStrings.confirm,
                      btnBackgroundColor: AppColors.primaryColor,
                      btnRadius: 12,
                      textColor: AppColors.whiteColor,
                      textFontSize: 14,
                      textFontWeight: FontWeight.w500,
                      btnPaddingHorizontal: .2,
                      btnPaddingVertical: .02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
