import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'boardUI/ludo_provider.dart';
import 'boardUI/main_screen.dart';
import 'ludo_ui/home.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(ChangeNotifierProvider(
    create: (_) => LudoProvider(),
    child: const Root(),
  ));
}

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
    return const MaterialApp(
      home: LudoOfflineGameScreen(),
    );
  }
}
