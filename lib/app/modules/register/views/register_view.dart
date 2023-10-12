import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:curve_app/app/core/extension.dart';
import 'package:curve_app/app/modules/login/views/login_view.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:curve_app/app/modules/network/views/no_connection_widget.dart';
import 'package:curve_app/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: heightMediaQuery(
                                  height: 0.05, context: context),
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
                              height: heightMediaQuery(
                                  height: 0.15, context: context),
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
                                  height: 0.02, context: context),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: IntlPhoneField(
                                textAlign: TextAlign.start,
                                invalidNumberMessage:
                                    "برجاء أدخال رقم هاتف صحيح",
                                focusNode: controller.focusNode,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.whiteColor,
                                  labelText: "رقم الهاتف",
                                  border: InputBorder.none,
                                ),
                                languageCode: "ar",
                                onChanged: (phone) {
                                  controller.phoneController.text =
                                      phone.completeNumber;
                                  print(phone.number);
                                },
                                onCountryChanged: (country) {
                                  controller.onChangedCountry(country.name);
                                  print('Country changed to: ${country.name}');
                                },
                              ),
                            ),
                            SizedBox(
                              height: heightMediaQuery(
                                  height: 0.02, context: context),
                            ),
                            CustomTextFormFieldWidget(
                                hasSuffix: false,
                                color: AppColors.whiteColor,
                                icon: Icons.email,
                                hint: AppStrings.email,
                                iconColor: AppColors.primaryColor,
                                onChanged: (input) {
                                  controller.onChangedEmail(input);
                                },
                                validator: (input) {
                                  if (input == null || input.trim().isEmpty) {
                                    return "من فضلك أدخل البريد الاليكترونى";
                                  } else if (!input.isValidEmail()) {
                                    return "من فضلك أدخل بريد أليكترونى صحيح";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                obscure: false,
                                controller: controller.emailController),
                            SizedBox(
                              height: heightMediaQuery(
                                  height: 0.02, context: context),
                            ),
                            CustomTextFormFieldWidget(
                                hasSuffix: false,
                                color: AppColors.whiteColor,
                                icon: Icons.person,
                                hint: AppStrings.name,
                                iconColor: AppColors.primaryColor,
                                onChanged: (input) {
                                  controller.onChangedName(input);
                                },
                                validator: (input) {
                                  if (input == null || input.trim().isEmpty) {
                                    return "من فضلك أدخل الاسم";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.name,
                                obscure: false,
                                controller: controller.nameController),
                            SizedBox(
                              height: heightMediaQuery(
                                  height: 0.02, context: context),
                            ),
                            CustomTextFormFieldWidget(
                                hasSuffix: true,
                                color: AppColors.whiteColor,
                                icon: Icons.lock,
                                hint: AppStrings.password,
                                iconColor: AppColors.primaryColor,
                                onChanged: (input) {
                                  controller.onChangedPassword(input);
                                },
                                validator: (input) {
                                  if (input == null || input.trim().isEmpty) {
                                    return "من فضلك أدخل كلمه المرور";
                                  } else if (input.length < 8) {
                                    return "كلمه المرور على الاقل 8 حروف أو أرقام";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscure: true,
                                controller: controller.passwordController),
                            SizedBox(
                              height: heightMediaQuery(
                                  height: 0.02, context: context),
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
                                  } else if (controller
                                          .rePasswordController.text !=
                                      controller.passwordController.text) {
                                    return "كلمه المرور غير متطابقة";
                                  } else {
                                    return null;
                                  }
                                },
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
                              child: Obx(() {
                                if (controller.isLoading.value == true) {
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
                                  return CustomButton(
                                      text: AppStrings.next,
                                      onPressed: () {
                                        if (controller.formKey.currentState!
                                            .validate()) {
                                          if (controller.checkBoxValue ==
                                                  true &&
                                              controller.countryName != "" &&
                                              controller.phoneController.text !=
                                                  "") {
                                            controller.registerFun();
                                          } else if (controller.countryName ==
                                              "") {
                                            Get.snackbar("كود البلد",
                                                "من فضلك أختر كود البلد",
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor: Colors.white,
                                                icon: const Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ));
                                          } else if (controller
                                                  .phoneController.text ==
                                              "") {
                                            Get.snackbar(
                                                "برجاء أدخال رقم الهاتف",
                                                "برجاء أدخال رقم الهاتف واكمال التسجيل",
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor: Colors.white,
                                                icon: const Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ));
                                          } else {
                                            Get.snackbar("برجاء أكمال التسجيل",
                                                "برجاء الموافقه على الشروط والاحكام",
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor: Colors.white,
                                                icon: const Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ));
                                          }
                                        }
                                      },
                                      textColor: AppColors.whiteColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      isShown: false,
                                      radius: 10,
                                      padding: 0,
                                      backgroundColor: AppColors.primaryColor);
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
                                    Get.to(() => LoginView(),
                                        arguments: {"type": ""});
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
                  ),
                )
              : NoConnevtionWidget(),
        );
      },
    );
  }
}
