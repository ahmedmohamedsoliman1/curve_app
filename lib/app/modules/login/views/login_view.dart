import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/home/views/home_view.dart';
import 'package:curve_app/app/modules/login/views/forget_password_view.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:curve_app/app/modules/network/views/no_connection_widget.dart';
import 'package:curve_app/app/modules/register/views/register_view.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:curve_app/app/widgets/custom_elevated_button.dart';
import 'package:curve_app/app/widgets/custom_text_form_feild.dart';
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
        return GetBuilder(
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
                                      onPressed: () {},
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
                                        onTap: (index){
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
                                customTextFormField(
                                  hint: AppStrings.email,
                                  keyboardType: TextInputType.emailAddress,
                                  icon: Icons.person,
                                  iconColor: AppColors.primaryColor,
                                  controller: controllerLogin.emailController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Please entre your correct Email';
                                    }
                                    final bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(controllerLogin
                                            .emailController.text);
                                    if (!emailValid) {
                                      return 'Please entre valid email like john@gmail.com';
                                    }
                                    return null;
                                  },
                                  color: AppColors.blackColor,
                                ),
                                const SizedBox(
                                  height: 28,
                                ),
                                customTextFormField(
                                  hint: AppStrings.password,
                                  obscure: true,
                                  icon: Icons.lock,
                                  iconColor: AppColors.primaryColor,
                                  controller:
                                      controllerLogin.passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please entre password';
                                    }
                                    return null;
                                  },
                                  color: AppColors.blackColor,
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
                                CustomElevatedButton(
                                  onPressed: () {
                                    if (controllerLogin
                                        .formKeyForLoginView.currentState!
                                        .validate()) {
                                      controllerLogin
                                          .loginWithEmailAndPassword();
                                      Get.to(const HomeView());
                                    }
                                  },
                                  btnPaddingHorizontal: .15,
                                  btnPaddingVertical: .025,
                                  btnText: AppStrings.login,
                                  btnBackgroundColor: AppColors.primaryColor,
                                  textColor: AppColors.whiteColor,
                                  btnRadius: 14,
                                  textFontSize: 14,
                                  textFontWeight: FontWeight.w500,
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
                                        Get.to(() => const RegisterView() ,
                                        arguments: {
                                          "type" : controllerLogin.isPressed == true ?
                                          controllerLogin.selectedIndex == 0 ?
                                          "user" : "engineer" : "user"
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
