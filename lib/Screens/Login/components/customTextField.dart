import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class customField extends StatelessWidget{
  TextInputType ?type;
  String ?hint;
  TextEditingController ?controller;
 final Function validator;
 IconData ?icon;
 bool obscureText;
 TextInputAction?textInputAction;
 customField({
  this.type,
  this.hint,
  this.controller,
  required this.validator,
  this.icon,
  required this.obscureText,
  this.textInputAction
 });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return  TextFormField(
  
  obscureText:obscureText,
  controller: controller,
            validator: (x) => validator(x), 
            keyboardType: type,
              textInputAction: textInputAction,
              cursorColor: kPrimaryColor,
             // onSaved: (email) {},
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(icon),
                ),
              ),
            );
  }

}