import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Helper/BuildText/BuildText.dart';
import '../Colors/custom_color.dart';

class TextFormFieldCustom extends TextFormField {
  String? text;
  String? hintText;
  double? textSize;
  double? textFormFieldWidth;
  double? textFormFieldHeight;
  double? radius;
  Color? backgroundColor;
  Color? textColor;
  bool? useBorder;
  BorderRadius? borderRadius;
  TextEditingController? controllers;
  TextFormFieldCustom(
      {this.text,
      this.hintText,
      this.textFormFieldWidth,
      this.textFormFieldHeight,
      this.textSize,
      this.radius,
      this.textColor,
      this.backgroundColor,
      this.useBorder,
      this.controllers,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: controllers,
      decoration: InputDecoration(
        filled: true,
         fillColor: Colors.grey,
         hintStyle: TextStyle(color: AppColors.blackColor

,
        ),

        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,


        hintText: text ?? "",

      ),
    );
  }
}

typedef CalbackFunction = void Function();
