import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/core/extension.dart';
import 'package:curve_app/app/modules/login/views/forget_password_view.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:curve_app/app/modules/network/views/no_connection_widget.dart';
import 'package:curve_app/app/modules/register/views/register_view.dart';
import 'package:curve_app/app/routes/app_pages.dart';
import 'package:curve_app/app/widgets/custom_TextFormField.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:curve_app/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

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
                          key: controllerLogin.formKeyForLoginView,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: 0.08, context: context),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    CustomButton(
                                      text: AppStrings.exit,
                                      icon: Icons.arrow_forward_ios_outlined,
                                      onPressed: () {
                                        Get.offNamed(Routes.HOME);
                                      },
                                      textColor: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: AppColors.primaryColor,
                                      iconColor: AppColors.whiteColor,
                                      fontSize: 16,
                                      isShown: true,
                                      radius: 5,
                                      padding: 6,
                                    ),
                                    CustomButton(
                                      text: AppStrings.arabic,
                                      backgroundColor: AppColors.blackColor,
                                      iconColor: AppColors.whiteColor,
                                      onPressed: () {},
                                      textColor: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      isShown: false,
                                      radius: 5,
                                      padding: 6,
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
                                const Text(
                                  AppStrings.login,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: 17,
                                      fontFamily: AppStrings.fontFamilyBold,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  AppStrings.loginToOpen,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 13,
                                    fontFamily: AppStrings.fontFamilyMedium,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 28,
                                ),
                                Material(
                                  shadowColor: AppColors.whiteColor,
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(10),
                                  child: DefaultTabController(
                                    length: 2,
                                    initialIndex: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TabBar(
                                        onTap: (index) {
                                          controllerLogin.onSelectedTabs(index);
                                        },
                                        indicator: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        labelColor: AppColors.whiteColor,
                                        labelStyle: const TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 16,
                                          fontFamily: AppStrings.fontFamilyBold,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        unselectedLabelColor:
                                            AppColors.blackColor,
                                        tabs: const [
                                          Tab(
                                              text:
                                                  AppStrings.serviceRequester),
                                          Tab(text: AppStrings.serviceProvider),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 28,
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
                                  height: 28,
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
                                    } else if (input.length < 4) {
                                      return "كلمه المرور على الاقل أربع حروف أو أرقام";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscure: true,
                                  controller:
                                      controllerLogin.passwordController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(ForgetPasswordView());
                                  },
                                  child: const Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Text(
                                      AppStrings.forgetPassword,
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 14,
                                        fontFamily:
                                            AppStrings.fontFamilyRegular,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                SizedBox(
                                  height: heightMediaQuery(
                                      height: 0.07, context: context),
                                  width: widthMediaQuery(
                                      width: 0.54, context: context),
                                  child: Obx(() {
                                    if (controllerLogin.isLoading.value ==
                                        true) {
                                      return ElevatedButton(
                                        onPressed: null,
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          backgroundColor:
                                              AppColors.primaryColor,
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
                                              .formKeyForLoginView.currentState!
                                              .validate()) {
                                            controllerLogin
                                                .loginWithEmailAndPassword();
                                          }
                                        },
                                        btnPaddingHorizontal: 0,
                                        btnPaddingVertical: 0,
                                        btnText: AppStrings.login,
                                        btnBackgroundColor:
                                            AppColors.primaryColor,
                                        textColor: AppColors.whiteColor,
                                        btnRadius: 14,
                                        textFontSize: 14,
                                        textFontWeight: FontWeight.w500,
                                      );
                                    }
                                  }),
                                ),
                                const SizedBox(
                                  height: 29,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    const Text(
                                      AppStrings.doNotHaveAccount,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 14,
                                        fontFamily:
                                            AppStrings.fontFamilyRegular,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => const RegisterView(),
                                            arguments: {
                                              "type": controllerLogin
                                                          .isPressed ==
                                                      true
                                                  ? controllerLogin
                                                              .selectedIndex ==
                                                          0
                                                      ? "user"
                                                      : "engineer"
                                                  : "user"
                                            });
                                      },
                                      child: const Text(
                                        AppStrings.newAccount,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 16,
                                          fontFamily:
                                              AppStrings.fontFamilyMedium,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                            'assets/images/linkedin.png'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                            'assets/images/google.png'),
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
                  : NoConnevtionWidget();
            });
      },
    );
  }
}
