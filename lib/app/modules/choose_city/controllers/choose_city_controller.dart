import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChooseCityController extends GetxController {

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  GlobalKey<CSCPickerState> cscPickerKey = GlobalKey();

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

  void onCountryChanged (String? value){
    countryValue = value! ;
    update();
  }
  void onStateChanged (String? value){
    if(value != null){
      stateValue = value;
    }
    update();
  }
  void onCityChanged (String? value){
    if (value != null){
      cityValue = value ;
      address = "$cityValue, $stateValue, $countryValue";
    }
    update();
  }

}
