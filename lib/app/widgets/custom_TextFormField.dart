import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;
typedef OnChanged = void Function(String)?;

Widget customTextFormFieldWidget({
  required String hint,
  required IconData icon,
  required TextEditingController controller,
  required Validator validator,
  required Color color,
  required Color iconColor,
  TextInputType? keyboardType,
  required OnChanged onChanged,
  bool obscure = false,
}) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
      BoxShadow(
          color: Colors.black.withOpacity(0.05),
          spreadRadius: 2,
          blurRadius: 2),
    ]),
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
          prefixIconColor: iconColor,
        ),
      ),
    ),
  );
}
