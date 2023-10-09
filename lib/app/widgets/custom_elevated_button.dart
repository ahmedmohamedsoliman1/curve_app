import 'package:curve_app/app/core/app_media_query.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.btnText,
    required this.btnBackgroundColor,
    required this.btnRadius,
    required this.textColor,
    required this.textFontSize,
    required this.textFontWeight,
    required this.btnPaddingHorizontal,
    required this.btnPaddingVertical,
  });

  void Function()? onPressed;
  String btnText;
  Color btnBackgroundColor;
  Color textColor;
  double btnRadius;

  double textFontSize;

  FontWeight textFontWeight;

  double btnPaddingHorizontal;

  double btnPaddingVertical;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(btnRadius)),
        padding: EdgeInsets.symmetric(
          horizontal:
              widthMediaQuery(width: btnPaddingHorizontal, context: context),
          vertical:
              heightMediaQuery(height: btnPaddingVertical, context: context),
        ),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontFamily: AppStrings.fontFamilyMedium,
          color: textColor,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
        ),
      ),
    );
  }
}
