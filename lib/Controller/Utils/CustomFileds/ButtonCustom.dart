import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Helper/BuildText/BuildText.dart';
import '../Colors/custom_color.dart';

class ButtonCustom extends MaterialButton {
  final CalbackFunction onPress;
  String text;
  double? textSize;
  double? buttonWidth;
  double? buttonHeight;
  double? radius;
  Color? backgroundColor;
  Color? textColor;
  bool? useBorder;
  BorderRadius? borderRadius;
  ButtonCustom(
      {required this.onPress,
      required this.text,
      this.buttonWidth,
      this.buttonHeight,
      this.textSize,
      this.radius,
      this.textColor,
      this.backgroundColor,
      this.useBorder,
      this.borderRadius})
      : super(onPressed: onPress);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.buttonRedPink,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        height: buttonHeight ?? 55,
        width: buttonWidth ?? Get.width,
        alignment: Alignment.center,
        child: BuildText.buildText(
          text: text,
          color: textColor,
          weight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

typedef CalbackFunction = void Function();
