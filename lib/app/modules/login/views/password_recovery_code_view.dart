import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/login/controllers/login_controller.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:curve_app/app/modules/network/views/no_connection_widget.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:curve_app/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordRecoveryCodeView extends GetView<LoginController> {
  PasswordRecoveryCodeView({Key? key}) : super(key: key);

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
                          key: controllerLogin.formKeyRecoveryCodeView,
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
                                  AppStrings.backCodePassword,
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
                                  AppStrings.entreCode,
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
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Material(
                                      shadowColor: AppColors.whiteColor,
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: TextFormField(
                                          onSaved: (newValue) {},
                                          controller: controllerLogin
                                              .firstInputController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          cursorColor: AppColors.blackColor,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.whiteColor),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.whiteColor),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            fillColor: AppColors.whiteColor,
                                            filled: true,
                                            border: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shadowColor: AppColors.whiteColor,
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: TextFormField(
                                          onSaved: (newValue) {},
                                          controller: controllerLogin
                                              .secondInputController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          cursorColor: AppColors.blackColor,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.whiteColor),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.whiteColor),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            fillColor: AppColors.whiteColor,
                                            filled: true,
                                            border: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shadowColor: AppColors.whiteColor,
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: TextFormField(
                                          onSaved: (newValue) {},
                                          controller: controllerLogin
                                              .thirdInputController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          cursorColor: AppColors.blackColor,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.whiteColor),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.whiteColor),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            fillColor: AppColors.whiteColor,
                                            filled: true,
                                            border: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      shadowColor: AppColors.whiteColor,
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        height: 55,
                                        width: 55,
                                        child: TextFormField(
                                          onSaved: (newValue) {},
                                          controller: controllerLogin
                                              .lastInputController,
                                          onChanged: (value) {
                                            if (value.length == 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                              controllerLogin
                                                      .isBtnActive.value =
                                                  value.length == 1
                                                      ? true
                                                      : false;
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          maxLines: 1,
                                          cursorColor: AppColors.blackColor,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.whiteColor),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: AppColors.whiteColor),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            fillColor: AppColors.whiteColor,
                                            filled: true,
                                            border: InputBorder.none,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                Obx(() {
                                  return CustomElevatedButton(
                                    onPressed:
                                        controllerLogin.isBtnActive.value ==
                                                true
                                            ? () {
                                                controllerLogin.checkCode();
                                                /*// Get.to(const CreateNewPasswordView());
                                          print(int.parse(controllerLogin.firstInputController.text +
                                              controllerLogin.secondInputController.text +
                                              controllerLogin.thirdInputController.text +
                                              controllerLogin.lastInputController.text));*/
                                              }
                                            : null,
                                    btnText: AppStrings.next,
                                    btnBackgroundColor: AppColors.primaryColor,
                                    btnRadius: 12,
                                    textColor: AppColors.whiteColor,
                                    textFontSize: 14,
                                    textFontWeight: FontWeight.w500,
                                    btnPaddingHorizontal: .2,
                                    btnPaddingVertical: .02,
                                  );
                                }),
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: .2, context: context),
                                ),
                                Text(
                                  controllerLogin.timerText,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 16,
                                    fontFamily: AppStrings.fontFamilyRegular,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 11,
                                ),
                                GestureDetector(
                                  onTap: controllerLogin.currentSeconds == 60
                                      ? () {
                                          controllerLogin.resetPasswordEmail();
                                        }
                                      : null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.history,
                                        color:
                                            controllerLogin.currentSeconds == 60
                                                ? AppColors.primaryColor
                                                : AppColors.grayColor,
                                        size: 24,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        AppStrings.resent,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              controllerLogin.currentSeconds ==
                                                      60
                                                  ? AppColors.primaryColor
                                                  : AppColors.grayColor,
                                          fontSize: 16,
                                          fontFamily:
                                              AppStrings.fontFamilyMedium,
                                          //fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : NoConnevtionWidget();
            });
      },
    );
  }
}
