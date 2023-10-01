import 'package:flutter/material.dart';

typedef Validator = String? Function(String?)?;
typedef OnChanged = void Function(String)?;


class CustomTextFormFieldWidget extends StatefulWidget {

    String hint ;
    IconData icon;
   TextEditingController controller;
   Validator validator;
   Color color;
   Color iconColor;
  TextInputType? keyboardType;
   OnChanged onChanged;
   IconData suffix = Icons.visibility ;
    bool obscure;
    bool hasSuffix ;
    bool visible = false ;

  CustomTextFormFieldWidget ({super.key, required this.obscure ,required this.hasSuffix , required this.hint ,required this.icon ,
  required this.controller , required this.validator , required this.color ,
  required this.iconColor , required this.keyboardType , required this.onChanged});

  @override
  State<CustomTextFormFieldWidget> createState() => _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {

  @override
  Widget build(BuildContext context) {
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
          obscureText: widget.obscure,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixIcon: widget.hasSuffix ? InkWell(
                onTap: (){
                  widget.visible = !widget.visible;
                  if (widget.visible == false){
                    widget.suffix = Icons.visibility ;
                    widget.obscure = true ;
                  }else {
                    widget.suffix = Icons.visibility_off_sharp ;
                    widget.obscure = false ;
                  }
                    setState(() {

                    });
                },
                child: Icon(widget.suffix)) : null,
            filled: true,
            fillColor: widget.color,
            border: InputBorder.none,
            hintText: widget.hint,
            prefixIcon: Icon(widget.icon),
            prefixIconColor: widget.iconColor,
          ),
        ),
      ),
    );
  }
}
