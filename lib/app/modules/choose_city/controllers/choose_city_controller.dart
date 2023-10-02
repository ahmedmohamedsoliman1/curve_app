import 'package:csc_picker/csc_picker.dart';
import 'package:curve_app/app/core/prefs.dart';
import 'package:curve_app/app/core/prefs_keys.dart';
import 'package:curve_app/app/data/auth/registerResponseModel.dart';
import 'package:curve_app/app/services/profile_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChooseCityController extends GetxController {

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  String country = "" ;
  GlobalKey<CSCPickerState> cscPickerKey = GlobalKey();
  RegisterResponseModel user = ProfileServices.currentUser;

  @override
  void onInit() {
    country = Get.arguments["country"];
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

  void onCountryChanged (String? value)async{
    countryValue = value! ;
    update();
  }
  void onStateChanged (String? value)async{
    if(value != null){
      stateValue = value;
    }
    update();
  }
  void onCityChanged (String? value)async{
    if (value != null){
      cityValue = value ;
      address = "$cityValue, $stateValue, $countryValue";
    }
    update();
  }
}
