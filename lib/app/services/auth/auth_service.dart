import 'package:curve_app/app/core/api_constants.dart';
import 'package:curve_app/app/core/api_dio.dart';
import 'package:curve_app/app/data/auth/loginResponseModel.dart';

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
}
