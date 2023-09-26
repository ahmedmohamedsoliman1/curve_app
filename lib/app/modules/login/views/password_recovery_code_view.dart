import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/login/controllers/login_controller.dart';
import 'package:curve_app/app/modules/login/views/create_new_password_view.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:curve_app/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordRecoveryCodeView extends GetView {
  const PasswordRecoveryCodeView({Key? key}) : super(key: key);

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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              cursorColor: AppColors.blackColor,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.circular(10),
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
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              cursorColor: AppColors.blackColor,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.circular(10),
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
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              cursorColor: AppColors.blackColor,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.circular(10),
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
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              cursorColor: AppColors.blackColor,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.circular(10),
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
                    CustomElevatedButton(
                      onPressed: () {
                        Get.to(const CreateNewPasswordView());
                      },
                      btnText: AppStrings.next,
                      btnBackgroundColor: AppColors.primaryColor,
                      btnRadius: 12,
                      textColor: AppColors.whiteColor,
                      textFontSize: 14,
                      textFontWeight: FontWeight.w500,
                      btnPaddingHorizontal: .2,
                      btnPaddingVertical: .02,
                    ),
                    SizedBox(
                      height: heightMediaQuery(height: .2, context: context),
                    ),
                    Text(
                      controller.timerText,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        const Icon(
                          Icons.history,
                          color: AppColors.primaryColor,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            AppStrings.resent,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 16,
                              fontFamily: AppStrings.fontFamilyMedium,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
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
