import 'package:spinwheel/Controller/Utils/Colors/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

import '../Controller/Helper/BuildText/BuildText.dart';
import '../Controller/ProjectController/common/OnboardingController/onboarding_controller.dart';
import '../Controller/Utils/StringDefine/StringDefine.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final OnBoardingController _onBdCtrl = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _onBdCtrl,
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  image: DecorationImage(
                    image: AssetImage(kHomeBack),
                    fit: BoxFit.fitHeight,
                  )),
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  Spacer(),
                  buildSizeBox(50.0, 0.0),
                  Center(
                    child: NeoPopTiltedButton(
                      isFloating: true,
                      onTapUp: () => _onBdCtrl.onTapPlayNow(context),
                      onTapDown: () => _onBdCtrl.onTapPlayNow(context),
                      decoration: const NeoPopTiltedButtonDecoration(
                        color: Color.fromRGBO(255, 235, 52, 1),
                        plunkColor: Color.fromRGBO(255, 235, 52, 1),
                        shadowColor: Color.fromRGBO(36, 36, 36, 1),
                        showShimmer: true,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 70.0,
                          vertical: 15,
                        ),
                        child: Text('Play Now'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
