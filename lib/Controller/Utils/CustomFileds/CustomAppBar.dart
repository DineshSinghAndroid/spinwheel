import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Helper/BuildText/BuildText.dart';
import '../Colors/custom_color.dart';

AppBar CustomAppBar({
  required String text,
}) {
  return AppBar(
    centerTitle: true,
    // leading: IconButton(
    //   icon: Icon(
    //     Icons.arrow_back,
    //     color: Colors.white,
    //     size: 23,
    //   ),
    //   onPressed: () {
    //     Get.back();
    //   },
    // ),

    backgroundColor: AppColors.blueColorApp,
    title: BuildText.buildText(
        text: text, size: 16, weight: FontWeight.w500, color: Colors.white),
  );
}
