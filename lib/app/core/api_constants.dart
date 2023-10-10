//https://curve.best/api/login
//https://curve.best/api/forgot_password
//https://curve.best/api/reset_password
//https://curve.best/api/welcome_screens
class ApiConstants {
  static const String baseUrl = "https://curve.best/api/";
  static const String welcomeScreens = "${baseUrl}welcome_screens";
  static const String registerApi = "${baseUrl}register";
  static const String loginApi = "${baseUrl}login";
  static const String forgotPassword = "${baseUrl}forgot_password";
  static const String resetPassword = "${baseUrl}reset_password";
}