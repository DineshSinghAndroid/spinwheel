import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'Controller/RouteController/RouteNames.dart';
import 'Controller/Utils/CustomFileds/ButtonCustom.dart';
import 'Controller/Utils/StringDefine/StringDefine.dart';
import 'package:spinwheel/Controller/RouteController/Route.dart' as router;

import 'app/Spinner/gameScreen.dart';

void main() {
  runApp(const MyApp());
}

String authToken = "";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Material(
        child: Scaffold(
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(color: Colors.green),
              child: Stack(
                children: [
                  Lottie.asset(kErrorLottie,
                      height: Get.height, width: Get.width),
                  Positioned(
                      left: 50,
                      bottom: 40,
                      child: ButtonCustom(
                        backgroundColor: Colors.white,
                        onPress: () {
                          Get.offAllNamed(onboardingScreen);
                        },
                        text: "Go To Home",
                        textColor: Colors.black,
                        buttonHeight: 60,
                        buttonWidth: 250,
                      ))
                ],
              ),
            ),
          ),
        ),
      );
    };
    return GetMaterialApp(
      initialRoute: onboardingScreen,
      // home: GameScreenMain(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
