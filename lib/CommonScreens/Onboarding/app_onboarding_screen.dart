import 'package:lottie/lottie.dart';
import 'package:spinwheel/Controller/Utils/Colors/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';

import '../../../Controller/Helper/BuildText/BuildText.dart';
import '../../../Controller/Utils/StringDefine/StringDefine.dart';
import 'appOnboardingController.dart';

class AppOnboardingScreen extends StatelessWidget {
  AppOnboardingScreen({super.key});

  final AppOnboardingController _onBdCtrl = Get.put(AppOnboardingController());

  @override
  Widget build(BuildContext context) {
    // _onBdCtrl.checkLogin();
    return GetBuilder(
      init: _onBdCtrl,
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          body: LoadScreen(
              widget: SafeArea(
                child: Stack(
                  children: [
                    Container(
                      height: Get.height,
                      width: Get.width,
                      // child: Lottie.asset(kBackgoundhomeLottie, fit: BoxFit.cover),
                      child: Image.asset("assets/common/money.jpg",
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 80,
                      child: Center(
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
                    ),
                  ],
                ),
              ),
              isLoading: _onBdCtrl.isLoading),
        );
      },
    );
  }
}
