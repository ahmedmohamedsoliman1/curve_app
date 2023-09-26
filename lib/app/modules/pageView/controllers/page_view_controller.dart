import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {

  RxInt pageIndex = 0.obs ;
  PageController pageController = PageController();
  double percent = 0.33333333 ;
  RxString iconTitle = "التالى".obs ;
  RxString nextButton = "".obs ;


  void equalPageIndex ({required int index}){
    pageIndex.value = index ;
    update();
  }

  void increasePercent (){
    if(pageIndex.value != 2){
      percent += 0.33333 ;
    }
    update();
  }
  void decreasePercent (){
    percent -= 0.33333 ;
    update();
  }

  void changeTitle (){
    if (pageIndex.value == 1){
      iconTitle.value = "أبدأ" ;
      print("do");
    }
  }

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

}
