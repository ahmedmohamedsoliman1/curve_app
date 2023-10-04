import 'package:curve_app/app/core/prefs.dart';
import 'package:curve_app/app/core/prefs_keys.dart';
import 'package:curve_app/app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../choose_city/views/choose_city_view.dart';

class RegisterController extends GetxController {

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  String? type  = "" ;
  bool checkBoxValue = false ;
  AuthService service = AuthService();
  String countryName = "" ;
  var formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs ;
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
  type = Get.arguments["type"];
    print(type);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeCheckBoxValue (bool? input){
    checkBoxValue = input! ;
    update();
  }

  void registerFun ()async{
    isLoading.value = true ;
    var response = await service.register(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        country: countryName == "" ? "Egypt" : countryName,
        governarate: "",
        city: "",
        type: type!);
     if (response != null) {
      if (response.message == null) {
        isLoading.value = false;
        await Prefs.saveUser(key: PrefsKeys.currentUser, model: response);
        print("saved");
        Get.off(() => const ChooseCityView(),
            arguments: {"country": countryName});
      }
    } else {
      isLoading.value = false;
      Get.snackbar(
          "خطأ فى أنشاء الحساب", "البريد الاليكترونى أو رقم الهاتف مسجل سابقا",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ));
    }
  }

  void onChangedPhone (String inputPhone){
    phoneController.text = inputPhone ;
    update();
  }
  void onChangedName (String inputName){
    nameController.text = inputName ;
    update();
  }
  void onChangedEmail (String inputEmail){
    emailController.text = inputEmail ;
    update();
  }

  void onChangedPassword (String inputPassword){
    passwordController.text = inputPassword ;
    update();
  }
  void onChangedRePassword (String inputRePassword){
    rePasswordController.text = inputRePassword ;
    update();
  }

  void onChangedCountry (String selectedCountry){
   countryName = selectedCountry ;
   print(type);
    update();
  }

}
