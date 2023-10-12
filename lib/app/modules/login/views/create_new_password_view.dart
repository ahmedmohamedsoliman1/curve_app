import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/login/controllers/login_controller.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:curve_app/app/modules/network/views/no_connection_widget.dart';
import 'package:curve_app/app/widgets/custom_TextFormField.dart';
import 'package:curve_app/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordView extends GetView<LoginController> {
  const CreateNewPasswordView({Key? key}) : super(key: key);

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
                        key: controllerLogin.formKeyCreateNewPassword,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              SizedBox(
                                height: heightMediaQuery(
                                    height: 0.08, context: context),
                              ),
                              /*Row(
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
                              ),*/
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
                              CustomTextFormFieldWidget(
                                hasSuffix: true,
                                color: AppColors.whiteColor,
                                icon: Icons.lock,
                                hint: AppStrings.password,
                                iconColor: AppColors.primaryColor,
                                onChanged: (input) {
                                  controllerLogin.onChangedPassword(input);
                                },
                                validator: (input) {
                                  if (input == null || input.trim().isEmpty) {
                                    return "من فضلك أدخل كلمه المرور";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscure: true,
                                controller: controllerLogin.passwordController,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              CustomTextFormFieldWidget(
                                hasSuffix: true,
                                color: AppColors.whiteColor,
                                icon: Icons.lock,
                                hint: AppStrings.confirmPass,
                                iconColor: AppColors.primaryColor,
                                onChanged: (input) {},
                                validator: (input) {
                                  if (input == null || input.trim().isEmpty) {
                                    return "من فضلك أدخل تأكيد كلمه المرور";
                                  } else if (controllerLogin
                                          .rePasswordController.text !=
                                      controllerLogin.passwordController.text) {
                                    return "كلمه المرور غير متطابقة";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscure: true,
                                controller:
                                    controllerLogin.rePasswordController,
                              ),
                              const SizedBox(
                                height: 50,
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
                                            .formKeyCreateNewPassword
                                            .currentState!
                                            .validate()) {
                                          controllerLogin.setNewPassword();
                                        }
                                      },
                                      btnText: AppStrings.confirm,
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
