import 'package:curve_app/app/core/app_strings.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onPressed;

  String text;

  Color textColor;

  FontWeight fontWeight;

  double fontSize;

  bool isShown;

  double radius;

  double padding;
  Color backgroundColor;
  Color? iconColor;
  IconData? icon;

  CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.fontWeight,
    required this.fontSize,
    required this.isShown,
    required this.radius,
    required this.padding,
    required this.backgroundColor,
    this.iconColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        backgroundColor: backgroundColor,
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: fontWeight,
                fontSize: fontSize,
                fontFamily: AppStrings.fontFamilyBold,
              ),
            ),
          ),
          isShown == true
              ? Icon(
            icon,
            size: 18,
            color: iconColor,
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}
