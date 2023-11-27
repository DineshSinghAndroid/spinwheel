import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
import 'package:spinwheel/GamesViews/LudoOffline/boardUI/widgets/board_widget.dart';
import 'package:spinwheel/GamesViews/LudoOffline/boardUI/widgets/dice_widget.dart';

import 'ludo_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text: "Ludo Gem"),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              // alignment: Alignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BoardWidget(),
                    Center(
                        child: SizedBox(
                      width: 50,
                      height: 50,
                      child: DiceWidget(),
                    )),
                  ],
                ),
                Consumer<LudoProvider>(
                  builder: (context, value, child) => value.winners.length != 3
                      ? Container(
                          color: Colors.black.withOpacity(0.8),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/ludoOffline/images/thankyou.gif",
                                  height: 120,
                                  width: Get.width,
                                ),
                                const Text("Thank you for playing",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center),
                                Text(
                                    "The Winners is: ${value.winners.map((e) => e.name.toUpperCase()).join(", ")}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                    textAlign: TextAlign.center),
                                const Divider(color: Colors.white),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        )
                      : Text(''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
