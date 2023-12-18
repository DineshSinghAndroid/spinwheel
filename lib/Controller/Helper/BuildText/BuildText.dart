import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildText {
  static Widget buildText(
      {required String text,
      TextStyle? style,
      TextDecoration? decoration,
      String? fontFamily,
      double? size,
      FontWeight? weight,
      Color? color,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines}) {
    return Text(text,
        style: style ??
            GoogleFonts.ptSerif(
              color: color ?? Colors.black,
              fontSize: size ?? 14,
              fontWeight: weight ?? FontWeight.w500,
            ));
  }
}

Widget buildSizeBox(height, width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget buildSizeBoxRatio({required double height, required double width}) {
  return SizedBox(
    height: Get.height * height.toDouble() / 100,
    width: Get.width * width.toDouble() / 100,
  );
}

double getHeightRatio({required double value}) {
  return Get.height * value.toDouble() / 100;
}

double getWidthRatio({required double value}) {
  return Get.width * value.toDouble() / 100;
}
