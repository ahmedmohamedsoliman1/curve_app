import 'package:flutter/material.dart';

double heightMediaQuery({
  required double height,
  required BuildContext context,
}) {
  return MediaQuery.of(context).size.height * height;
}

double widthMediaQuery({
  required double width,
  required BuildContext context,
}) {
  return MediaQuery.of(context).size.width * width;
}
