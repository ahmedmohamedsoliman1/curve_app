import 'package:flutter/cupertino.dart';

Widget customText({required String text , required double fontSize ,
required FontWeight fontWeight , required Color color , required String fontFamily}){
  return Text(text , style: TextStyle(
    fontWeight: fontWeight , fontSize: fontSize , color: color ,
    fontFamily: fontFamily
  ),);
}