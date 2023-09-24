import 'package:curve_app/app/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  VoidCallback onPressed ;
  String text ;
  Color color ;
  FontWeight fontWeight ;
  double fontSize ;
  bool isShown ;
  double radius ;
  double padding ;

  CustomButton ({super.key, required this.text , required this.onPressed ,
  required this.color , required this.fontWeight , required this.fontSize ,
  required this.isShown , required this.radius , required this.padding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed , style: ElevatedButton.styleFrom(
        shape:  RoundedRectangleBorder( 
          borderRadius: BorderRadius.circular(radius)
        ) ,
    backgroundColor: AppColors.primaryColor), child:  Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: padding),
          child: Text(
            text , style: TextStyle(
            color: color , fontWeight: fontWeight , fontSize: fontSize ,
              fontFamily: "Tajawal"
          ),
          ),
        ),
        isShown == true ? const Icon(Icons.arrow_forward_ios , size: 20, color: AppColors.whiteColor,)
            : Container(),
      ],
    ) ,);
  }
}