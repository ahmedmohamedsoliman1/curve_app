import 'dart:io';

import 'package:curve_app/app/core/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.prefs = await SharedPreferences.getInstance();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
