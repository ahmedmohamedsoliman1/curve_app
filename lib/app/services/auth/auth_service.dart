import 'dart:io';

import 'package:curve_app/app/core/api_constants.dart';
import 'package:curve_app/app/core/api_dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../data/auth/registerResponseModel.dart';

class AuthService {

  Future <RegisterResponseModel?> register (
  {
    required String name , required String email , required String phone ,
    required String password , required String country , required String governarate,
    required String city , required String type
  }
  ) async {
    String url = ApiConstants.registerApi;
    var response = await Api.post(url , body: {
      "name" : name ,
      "email" : email ,
      "phone" : phone ,
      "password" : password ,
      "country" : country ,
      "governrate" : governarate ,
       "city" : city ,
      "type" : type
    } , isFormData: true , headers: {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    }) ;

    if (response.data["data"] != null){
      print(response.data["data"]);
      return RegisterResponseModel.fromJson(response.data);
    }else {
      return null ;
    }

  }
}