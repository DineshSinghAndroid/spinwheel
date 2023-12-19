import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinwheel/tetste.dart';

import 'Controller/Helper/Shared Preferences/SharedPreferences.dart';
import 'Controller/RouteController/RouteNames.dart';
import 'Controller/Utils/CustomFileds/ButtonCustom.dart';
import 'Controller/Utils/StringDefine/StringDefine.dart';
import 'Controller/Utils/Utils.dart';
import 'GamesViews/LudoOffline/boardUI/ludo_provider.dart';
import 'package:spinwheel/Controller/RouteController/Route.dart' as router;

main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(ChangeNotifierProvider(
    create: (_) => LudoProvider(),
    child: const Root(),
  ));
}

String authToken = "";
bool? userLoggedIn;

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) => inits());

    super.initState();
  }

  void inits() {
    ///Initialize images and precache it
    precacheImage(
        const AssetImage("assets/ludoOffline/images/thankyou.gif"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/board.png"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/dice/1.png"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/dice/2.png"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/dice/3.png"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/dice/4.png"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/dice/5.png"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/dice/6.png"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/dice/draw.gif"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/crown/1st.png"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/crown/2nd.png"), context);
    precacheImage(
        const AssetImage("assets/ludoOffline/images/crown/3rd.png"), context);
  }

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
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
