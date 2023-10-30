import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';

import '../../RouteController/RouteNames.dart';

class AppOnboardingControlller extends GetxController {
  List gameImages = [
    kLudoBoard,
    kColorPrediction,
    kSpinwheel,
    kAviator,
    kSnackladde,
  ];
  List topSliderImages = [kPlayAndWiin, kPlayAndWiin, kPlayAndWiin];
  List textSlider = [
    "Dinesh won 23000 By Playing Ludo,  Ram won 23000 By Playing Lud  Rahul won 23000 By Playing Ludo,  Satish won 23000 By Playing Lud  Loki won 23000 By Playing Ludo,  Punnet won 23000 By Playing Ludo,",
  ];

  onGameTap({required int index}) {
    print(index);
    if (index == 1) {
      Get.toNamed(ludoGameHomeScreen);
    } else if (index == 2) {
      Get.toNamed(colorPredictionGame);
    } else if (index == 3) {
      Get.toNamed(spinnerHomeScreen);
    } else {
      Get.snackbar(
          "Coming Soon", "This game is yet in development, will available soon",
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    }
  }
}
