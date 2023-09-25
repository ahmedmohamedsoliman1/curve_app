import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/app_colors.dart';

class NetworkController extends GetxController {

  var connectivityStatus = 0 ;
  Connectivity connectivity = Connectivity();
  ConnectivityResult? result ;
  StreamSubscription<ConnectivityResult>? streamSubscription ;
  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    streamSubscription = connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future <void>initConnectivity ()async{
    try {
     result  = await connectivity.checkConnectivity();
    }on PlatformException catch (e){
      print(e.toString());
    }
    return updateConnectionStatus (result!);
  }

  updateConnectionStatus(ConnectivityResult result){
   switch (result) {
     case ConnectivityResult.wifi :
       connectivityStatus = 1 ;
       update();
       break;
     case ConnectivityResult.bluetooth:
       connectivityStatus = 2 ;
       update();
       break;
     case ConnectivityResult.ethernet:
       connectivityStatus = 3 ;
       update();
       break ;
     case ConnectivityResult.mobile:
       connectivityStatus = 4 ;
       update();
       break ;
     case ConnectivityResult.none:
       connectivityStatus = 0 ;
       update();
       break ;
     case ConnectivityResult.vpn:
       connectivityStatus = 5 ;
       update();
       break ;
     case ConnectivityResult.other:
       connectivityStatus = 6 ;
       update();
       break ;
       default :
         Get.snackbar("Network Error", "Please check network and try again" ,
         duration: Duration(seconds: 2) , borderRadius: 10 ,
         snackPosition: SnackPosition.BOTTOM , colorText: AppColors.blackColor);
         break ;
   }
  }
}
