import 'package:country_code_picker/country_code_picker.dart';
import 'package:curve_app/app/core/prefs.dart';
import 'package:curve_app/app/core/prefs_keys.dart';
import 'package:curve_app/app/services/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../choose_city/views/choose_city_view.dart';

class RegisterController extends GetxController {

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  String type = Get.arguments["type"];
  bool checkBoxValue = false ;
  AuthService service = AuthService();
  CountryCode code = CountryCode() ;
  var formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs ;

  @override
  void onInit() {
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
        country: code == null ? "+20" : code.toString(),
        governarate: "",
        city: "",
        type: type);
     if (response != null){
       if (response.data != null){
         isLoading.value = false ;
         await Prefs.saveUser(key: PrefsKeys.currentUser, model: response);
         print("saved");
         Get.to(() => const ChooseCityView());
       }else {
         isLoading.value = false ;
         print("error");
         Get.snackbar("خطأ فى أنشاء الحساب", "${response.errors}");
       }
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

  void onChangedCode (CountryCode selectedCode){
   code = selectedCode ;
    update();
  }

}
