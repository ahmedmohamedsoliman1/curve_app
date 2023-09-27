import 'package:curve_app/app/core/app_colors.dart';
import 'package:curve_app/app/core/app_strings.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;

Widget customTextFormField({
  required String hint,
  required IconData icon,
  required TextEditingController controller,
  required Validator validator,
  required Color color,
  required Color iconColor,
  TextInputType? keyboardType,
  bool obscure = false,
}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 13,
          fontFamily: AppStrings.fontFamilyMedium,
        ),
        border: InputBorder.none,
        fillColor: AppColors.whiteColor,
        filled: true,
        prefixIcon: Icon(
          icon,
          color: iconColor,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blackColor.withOpacity(0.07),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blackColor.withOpacity(0.07),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blackColor.withOpacity(0.07),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blackColor.withOpacity(0.07),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
