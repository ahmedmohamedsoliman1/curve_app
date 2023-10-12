import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/extension.dart';
import 'package:curve_app/app/modules/login/controllers/login_controller.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:curve_app/app/modules/network/views/no_connection_widget.dart';
import 'package:curve_app/app/widgets/custom_TextFormField.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:curve_app/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_strings.dart';

class ForgetPasswordView extends GetView<LoginController> {
  ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controllerLogin) {
        return GetBuilder<NetworkController>(
          init: NetworkController(),
          builder: (controller) {
            return controller.connectivityStatus == 4 ||
                    controller.connectivityStatus == 1
                ? Scaffold(
                    backgroundColor: AppColors.whiteColor,
                    body: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: controllerLogin.formKeyForForgetPasswordView,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                width: widthMediaQuery(
                                    width: .5, context: context),
                                height: heightMediaQuery(
                                    height: .19, context: context),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Text(
                                AppStrings.forgetPass,
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
                                AppStrings.entrePhoneNumber,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 13,
                                  fontFamily: AppStrings.fontFamilyMedium,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              CustomTextFormFieldWidget(
                                hasSuffix: false,
                                color: AppColors.whiteColor,
                                icon: Icons.email,
                                hint: AppStrings.email,
                                iconColor: AppColors.primaryColor,
                                onChanged: (input) {
                                  controllerLogin.onChangedEmail(input);
                                },
                                validator: (input) {
                                  if (input == null || input.trim().isEmpty) {
                                    return "من فضلك أدخل البريد الالكترونى";
                                  } else if (!input.isValidEmail()) {
                                    return "من فضلك أدخل بريد ألكترونى صحيح";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                obscure: false,
                                controller: controllerLogin.emailController,
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              SizedBox(
                                height: heightMediaQuery(
                                    height: 0.07, context: context),
                                width: widthMediaQuery(
                                    width: 0.48, context: context),
                                child: Obx(() {
                                  if (controllerLogin.isLoading.value == true) {
                                    return ElevatedButton(
                                      onPressed: null,
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor: AppColors.primaryColor,
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return CustomElevatedButton(
                                      onPressed: () {
                                        if (controllerLogin
                                            .formKeyForForgetPasswordView
                                            .currentState!
                                            .validate()) {
                                          controllerLogin.resetPasswordEmail();
                                        }
                                      },
                                      btnText: AppStrings.next,
                                      btnBackgroundColor:
                                          AppColors.primaryColor,
                                      btnRadius: 12,
                                      textColor: AppColors.whiteColor,
                                      textFontSize: 14,
                                      textFontWeight: FontWeight.w500,
                                      btnPaddingHorizontal: .2,
                                      btnPaddingVertical: .02,
                                    );
                                  }
                                }),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: AppColors.primaryColor, width: 2),
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
                                      fontFamily: AppStrings.fontFamilyRegular,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : NoConnevtionWidget();
          },
        );
      },
    );
  }
}
