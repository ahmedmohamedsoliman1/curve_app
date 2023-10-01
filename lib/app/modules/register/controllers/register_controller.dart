import 'package:country_code_picker/country_code_picker.dart';
import 'package:curve_app/app/services/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool checkBoxValue = false ;
  AuthService service = AuthService();
  CountryCode code = CountryCode() ;
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

  // void registerFun ()async{
  //   var response = await service.register(
  //       name: nameController.text,
  //       email: emailController.text,
  //       phone: phoneController.text,
  //       password: passwordController.text,
  //       country: country,
  //       governarate: "",
  //       city: "",
  //       type: type);
  //
  //
  // }

  void onChangedCode (CountryCode selectedCode){
   code = selectedCode ;
    update();
  }

}
