import 'package:get/get.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';

class AppOnboardingControlller extends GetxController {
  List gameImages = [
    kLudoBoard,
    kSnackladde,
    kSpinwheel,
    kColorPrediction,
    kLudoBoard,
    kSnackladde,
    kSpinwheel,
    kColorPrediction,
  ];
  List topSliderImages = [kPlayAndWiin, kPlayAndWiin, kPlayAndWiin];

  onGameTap({required int index}) {
    print(index);
  }
}
