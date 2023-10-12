import 'package:curve_app/app/core/api_constants.dart';
import 'package:curve_app/app/core/api_dio.dart';
import 'package:curve_app/app/data/auth/loginResponseModel.dart';
import 'package:curve_app/app/data/auth/resetPasswordEmailResponse.dart';
import 'package:curve_app/app/data/auth/setNewPasswordModel.dart';

import '../../data/auth/registerResponseModel.dart';

class AuthService {
  Future<RegisterResponseModel?> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String country,
    required String governarate,
    required String city,
    required String type,
  }) async {
    String url = "https://curve.best/api/register";
    var response = await Api.post(url,
        body: {
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
          "country": country,
          "governrate": governarate,
          "city": city,
          "type": type
        },
        isFormData: true,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        });

    if (response.data["data"] != null) {
      print(response.data["data"]);
      return RegisterResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<LoginResponseModel?> login({
    required String email,
    required String password,
  }) async {
    String url = ApiConstants.loginApi;
    var response = await Api.post(
      url,
      body: {
        "email": email,
        "password": password,
      },
      isFormData: true,
    );
    if (response.data["data"] != null) {
      print(response.data["data"]);
      return LoginResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ResetPasswordEmailModel?> resetPasswordEmail({
    required String email,
  }) async {
    String url = ApiConstants.forgotPassword;
    var response = await Api.post(url,
        body: {
          "email": email,
        },
        isFormData: true,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        });
    if (response.data != null) {
      return ResetPasswordEmailModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<SetNewPasswordModel?> setNewPassword({
    required String password,
    required int code,
    required String email,
    required String method,
  }) async {
    String url = ApiConstants.resetPassword;
    var response = await Api.post(url,
        body: {
          "password": password,
          "code": code,
          "email": email,
          "_method": method,
        },
        isFormData: true,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        });
    if (response.data != null) {
      return SetNewPasswordModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
