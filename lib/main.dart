import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:spinwheel/tetste.dart';

import 'CommonScreens/ProfileScreens/ProfileScreen.dart';
import 'Controller/RouteController/RouteNames.dart';
import 'Controller/Utils/CustomFileds/ButtonCustom.dart';
import 'Controller/Utils/StringDefine/StringDefine.dart';
import 'GamesViews/LudoOffline/boardUI/ludo_provider.dart';
import 'GamesViews/LudoOffline/ludo_ui/LudoOfflineBottomNavigationBarScreen/ludo_offline_bottom_bar_screen.dart';
import 'package:spinwheel/Controller/RouteController/Route.dart' as router;

import 'GamesViews/LudoOffline/ludo_ui/LudoOfflineHomeScreen/ludo_offline_profilescreen.dart';
import 'GamesViews/Spinner/spinner_gameScreen.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(ChangeNotifierProvider(
    create: (_) => LudoProvider(),
    child: const Root(),
  ));
}

String authToken = "";

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
      // home: SpinnerHomeScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
