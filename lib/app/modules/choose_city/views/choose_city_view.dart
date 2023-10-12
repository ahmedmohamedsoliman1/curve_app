import 'package:csc_picker/csc_picker.dart';
import 'package:curve_app/app/data/auth/registerResponseModel.dart';
import 'package:curve_app/app/modules/network/controllers/network_controller.dart';
import 'package:curve_app/app/modules/network/views/no_connection_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_media_query.dart';
import '../../../core/app_strings.dart';
import '../../../core/prefs.dart';
import '../../../core/prefs_keys.dart';
import '../../../widgets/custom_button.dart';
import '../../login/views/password_recovery_code_view.dart';
import '../controllers/choose_city_controller.dart';

class ChooseCityView extends GetView<ChooseCityController> {
  const ChooseCityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseCityController>(
      init: ChooseCityController(),
      builder: (controller) {
        return GetBuilder<NetworkController>(
          init: NetworkController(),
            builder: (networkController) => networkController.connectivityStatus == 4 ||
                networkController.connectivityStatus == 1 ? Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: heightMediaQuery(height: 0.1, context: context),),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("إنشاء حساب" , style: TextStyle(
                              color: AppColors.blackColor , fontWeight: FontWeight.bold ,
                              fontFamily: AppStrings.fontFamilyBold ,
                              fontSize: 17
                          ),),
                        ],
                      ),
                      SizedBox(height: heightMediaQuery(height: 0.03, context: context),),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("اختر الدوله / المحافظة / المنطقه أو الحى " , style: TextStyle(
                              color: AppColors.blackColor , fontWeight: FontWeight.bold ,
                              fontFamily: AppStrings.fontFamilyBold ,
                              fontSize: 17
                          ),),
                        ],
                      ),
                      SizedBox(height: heightMediaQuery(height: 0.06, context: context),),
                      Center(
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: heightMediaQuery(height: 0.5, context: context),
                            child: Column(
                              children: [
                                CSCPicker(
                                  layout: Layout.vertical,
                                  key: controller.cscPickerKey,
                                  showStates: true,
                                  showCities: true,
                                  flagState: CountryFlag.ENABLE,
                                  dropdownDecoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white,
                                      border:
                                      Border.all(color: Colors.grey.shade300, width: 1)),
                                  disabledDropdownDecoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      color: Colors.grey.shade300,
                                      border:
                                      Border.all(color: Colors.grey.shade300, width: 1)),
                                  countryDropdownLabel: controller.country,
                                  stateDropdownLabel: "أختر المنطقه",
                                  cityDropdownLabel: "أختر المحافظه",
                                  selectedItemStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  dropdownHeadingStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  dropdownItemStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  dropdownDialogRadius: 10.0,
                                  searchBarRadius: 10.0,
                                  onCountryChanged: (String? value){
                                    controller.onCountryChanged(value);
                                  },
                                  onStateChanged: (String? value){
                                    controller.onStateChanged(value);
                                  },
                                  onCityChanged: (String? value){
                                    controller.onCityChanged(value);
                                  },
                                  currentCountry: controller.country,
                                ),
                                const SizedBox(height: 30,),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.05),
                                              blurRadius: 2 ,
                                              spreadRadius: 2
                                          )
                                        ]
                                    ),
                                    child: Center(child: Text(controller.address))),
                              ],
                            )),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: heightMediaQuery(height: 0.07, context: context),
                        width: widthMediaQuery(width: 0.5, context: context),
                        child: CustomButton(
                            text: AppStrings.next,
                            onPressed: ()async{
                                if (controller.countryValue != "" &&
                                    controller.stateValue != "" &&
                                    controller.cityValue != "") {
                                Get.off(() => PasswordRecoveryCodeView(),
                                      arguments: {
                                        'email': controller.getEmail
                                      });
                                } else {
                                  Get.snackbar("من فضلك اكمل التسجيل",
                                      "برجاء اختيار البلد / المحافظة / المنطقة أو الحى",
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: Colors.white,
                                      icon: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ));
                                }

                                controller.user = controller.user.copyWith(
                                  data: Data(
                                    city: controller.cityValue,
                                    country: controller.countryValue,
                                    governrate: controller.stateValue,
                                    platform: controller.user.data!.platform,
                                    updatedAt: controller.user.data!.updatedAt,
                                    phone: controller.user.data!.phone,
                                    email: controller.user.data!.email,
                                    createdAt: controller.user.data!.createdAt,
                                    id: controller.user.data!.id,
                                    name: controller.user.data!.name ,
                                  type: controller.user.data!.type ,
                                ),
                                token: controller.user.token ,
                                type: controller.user.data!.type ,
                              );
                              await Prefs.saveUser(key: PrefsKeys.currentUser, model: controller.user);
                              print(controller.user.data!.country);
                              print(controller.user.data!.city);
                              print(controller.user.data!.governrate);
                              print("user is : ${controller.user.toJson()}");
                            },
                            textColor: AppColors.whiteColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            isShown: false,
                            radius: 10,
                            padding: 0,
                            backgroundColor: AppColors.primaryColor),
                      ),
                      SizedBox(height: heightMediaQuery(height: 0.1, context: context),)
                    ],
                  ),
                )
            ) : NoConnevtionWidget());
      },

    );
  }
}
