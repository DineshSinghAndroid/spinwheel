import 'package:flutter/material.dart';

import 'colors_utils.dart';

class ReusableColoredContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? font_Size;
  final String? text;

  const ReusableColoredContainer({super.key,
     this.height,
     this.width,
     this.text,
     this.font_Size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow, width: 2),
        color: ColorsUtils.mediumBlue, // You can adjust the color here
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        text!,
        style:  TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: font_Size,
        ),
      ),
    );
  }
}
