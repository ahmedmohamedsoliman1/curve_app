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
  bool obscure = false,
}) {
  return Material(
    shadowColor: AppColors.whiteColor,
    elevation: 5,
    borderRadius: BorderRadius.circular(15),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: color,
            fontWeight: FontWeight.w400,
            fontSize: 13,
            fontFamily: AppStrings.fontFamily,
          ),
          border: InputBorder.none,
          fillColor: AppColors.whiteColor,
          filled: true,
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ),
  );
}
