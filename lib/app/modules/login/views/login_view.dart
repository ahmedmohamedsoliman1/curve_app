import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:curve_app/app/widgets/custom_elevated_button.dart';
import 'package:curve_app/app/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: heightMediaQuery(height: 0.08, context: context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  width: widthMediaQuery(width: .5, context: context),
                  height: heightMediaQuery(height: .19, context: context),
                ),
                const Text(
                  AppStrings.login,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 18,
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
                    fontSize: 14,
                    fontFamily: AppStrings.fontFamilyBold,
                    fontWeight: FontWeight.w300,
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
                    initialIndex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelColor: AppColors.whiteColor,
                        labelStyle: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontFamily: AppStrings.fontFamilyBold,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelColor: AppColors.blackColor,
                        tabs: const [
                          Tab(text: AppStrings.serviceRequester),
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
                  hint: AppStrings.emailAndPhone,
                  icon: Icons.person,
                  iconColor: AppColors.primaryColor,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please , Entre your correct Email';
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailController.text);
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
                  controller: passwordController,
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
                  onTap: () {},
                  child: const Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      AppStrings.forgetPassword,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontFamily: AppStrings.fontFamily,
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
                    if (formKey.currentState!.validate()) {}
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
                  children: [
                    const Text(
                      AppStrings.doNotHaveAccount,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontFamily: AppStrings.fontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        AppStrings.newAccount,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontFamily: AppStrings.fontFamily,
                          fontWeight: FontWeight.w400,
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
  }
}
