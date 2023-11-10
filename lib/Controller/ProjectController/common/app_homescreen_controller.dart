import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';

import '../../RouteController/RouteNames.dart';

class AppOnboardingControlller extends GetxController {
  List gameImages = [
    kLudoBoard,
    kJackpot1,
    kColorPrediction,
    kSpinwheel,
    kAviator,
    kSnackladde,
  ];
  List topSliderImages = [kPlayAndWiin, khomebanner2, kPlayAndWiin];
  List textSlider = [
    "Rahul won 18000 By Playing Ludo,  Ram won 52000 By Playing Ludo  Shree won 5224 By Playing Ludo,  Jyoti won 4213 By Playing Lud  Suman won 6242 By Playing Ludo,  Raj won 2121 By Playing Ludo,",
  ];

  onGameTap({required int index}) {
    print(index);
    if (index == 1) {
      Get.toNamed(ludoGameHomeScreen);
    }

    // else if (index == 2) {
    //   // Get.toNamed(colorPredictionGame);
    // }
    //
    else if (index == 3) {
      Get.toNamed(colorPredictionGame);
    }
    // else if (index == 3) {
    //   Get.toNamed(spinnerHomeScreen);
    // }
    else {
      Get.snackbar(
          "Coming Soon", "This game is yet in development, will available soon",
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    }
  }
}
