import 'package:country_code_picker/country_code_picker.dart';
import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/modules/choose_city/views/choose_city_view.dart';
import 'package:curve_app/app/modules/login/views/login_view.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:curve_app/app/modules/network/views/no_connection_widget.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_TextFormField.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterController(),
      builder: (controller) {
        return GetBuilder<NetworkController>(
          init: NetworkController(),
          builder: (networkController) => networkController
                          .connectivityStatus ==
                      4 ||
                  networkController.connectivityStatus == 1
              ? Scaffold(
                  backgroundColor: AppColors.whiteColor,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: heightMediaQuery(
                                height: 0.07, context: context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: CustomButton(
                                    icon: Icons.arrow_forward_ios,
                                    iconColor: AppColors.whiteColor,
                                    text: "",
                                    onPressed: () {
                                      Get.back();
                                    },
                                    textColor: Colors.transparent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 1,
                                    isShown: true,
                                    radius: 10,
                                    padding: 0,
                                    backgroundColor: AppColors.primaryColor),
                              ),
                            ],
                          ),
                          Image(
                            image: const AssetImage("assets/images/logo.png"),
                            width:
                                widthMediaQuery(width: 0.5, context: context),
                            height:
                                heightMediaQuery(height: 0.2, context: context),
                          ),
                          const Text(
                            AppStrings.createNewAccount,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppStrings.fontFamilyBold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: heightMediaQuery(
                                height: 0.05, context: context),
                          ),
                          Row(
                            children: [
                              const CountryCodePicker(
                                onChanged: print,
                                initialSelection: 'EG',
                                favorite: ['+20', 'EG'],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              ),
                              Expanded(
                                child: customTextFormFieldWidget(
                                    color: AppColors.whiteColor,
                                    icon: Icons.phone,
                                    hint: AppStrings.phoneNum,
                                    iconColor: AppColors.primaryColor,
                                    onChanged: (input) {},
                                    validator: (input) {},
                                    keyboardType: TextInputType.number,
                                    obscure: false,
                                    controller: controller.phoneController),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: heightMediaQuery(
                                height: 0.02, context: context),
                          ),
                          customTextFormFieldWidget(
                              color: AppColors.whiteColor,
                              icon: Icons.email,
                              hint: AppStrings.email,
                              iconColor: AppColors.primaryColor,
                              onChanged: (input) {},
                              validator: (input) {},
                              keyboardType: TextInputType.emailAddress,
                              obscure: false,
                              controller: controller.emailController),
                          SizedBox(
                            height: heightMediaQuery(
                                height: 0.02, context: context),
                          ),
                          customTextFormFieldWidget(
                              color: AppColors.whiteColor,
                              icon: Icons.person,
                              hint: AppStrings.name,
                              iconColor: AppColors.primaryColor,
                              onChanged: (input) {},
                              validator: (input) {},
                              keyboardType: TextInputType.name,
                              obscure: false,
                              controller: controller.nameController),
                          SizedBox(
                            height: heightMediaQuery(
                                height: 0.02, context: context),
                          ),
                          customTextFormFieldWidget(
                              color: AppColors.whiteColor,
                              icon: Icons.lock,
                              hint: AppStrings.password,
                              iconColor: AppColors.primaryColor,
                              onChanged: (input) {},
                              validator: (input) {},
                              keyboardType: TextInputType.visiblePassword,
                              obscure: true,
                              controller: controller.passwordController),
                          SizedBox(
                            height: heightMediaQuery(
                                height: 0.02, context: context),
                          ),
                          customTextFormFieldWidget(
                              color: AppColors.whiteColor,
                              icon: Icons.lock,
                              hint: AppStrings.confirmPass,
                              iconColor: AppColors.primaryColor,
                              onChanged: (input) {},
                              validator: (input) {},
                              keyboardType: TextInputType.visiblePassword,
                              obscure: true,
                              controller: controller.rePasswordController),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                AppStrings.agreeSH,
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontFamily: AppStrings.fontFamilyRegular,
                                    fontSize: 12),
                              ),
                              GetBuilder(
                                  init: RegisterController(),
                                  builder: (controller) {
                                    return Checkbox(
                                        side: const BorderSide(
                                            color: AppColors.primaryColor,
                                            width: 2),
                                        autofocus: true,
                                        activeColor: AppColors.primaryColor,
                                        value: controller.checkBoxValue,
                                        onChanged:
                                            controller.changeCheckBoxValue);
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: heightMediaQuery(
                                height: 0.07, context: context),
                            width:
                                widthMediaQuery(width: 0.5, context: context),
                            child: CustomButton(
                                text: AppStrings.next,
                                onPressed: () {
                                  Get.to(() => const ChooseCityView());
                                },
                                textColor: AppColors.whiteColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                isShown: false,
                                radius: 10,
                                padding: 0,
                                backgroundColor: AppColors.primaryColor),
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            children: [
                              const Text(
                                AppStrings.haveAccount,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 14,
                                  fontFamily: AppStrings.fontFamilyRegular,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => LoginView());
                                },
                                child: const Text(
                                  AppStrings.login,
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
                )
              : NoConnevtionWidget(),
        );
      },
    );
  }
}
