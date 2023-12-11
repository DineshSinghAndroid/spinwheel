import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spinwheel/Controller/Helper/BuildText/BuildText.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/LudoOfflineHomeScreen/ludoOfflineHomeScreen.dart';

import '../../../../Controller/Utils/Colors/custom_color.dart';
import '../VideoTutorialsScreen/video_tutorials_screen.dart';

class LudoOfflineBottomNavBarScreen extends StatefulWidget {
  @override
  LudoOfflineBottomNavBarScreenState createState() =>
      LudoOfflineBottomNavBarScreenState();
}

class LudoOfflineBottomNavBarScreenState
    extends State<LudoOfflineBottomNavBarScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 60,
            width: Get.width,
            child: TabBar(
                isScrollable: false,
                // indicatorPadding: const EdgeInsets.only(top: 0, bottom: 0),
                indicatorColor: AppColors.buttonRedPink,
                unselectedLabelColor: Colors.white,
                labelColor: AppColors.blackColor,
                dividerColor: AppColors.transparentColor,
                labelStyle: TextStyle(color: Colors.red, fontSize: 14),
                indicatorSize: TabBarIndicatorSize.tab,
                automaticIndicatorColorAdjustment: true,
                indicatorWeight: 5,
                unselectedLabelStyle: const TextStyle(color: Colors.white),
                tabs: [
                  Column(
                    children: [
                      Icon(
                        Icons.videogame_asset_outlined,
                        color: AppColors.redColor,
                        size: 30,
                      ),
                      BuildText.buildText(text: "Game", color: Colors.grey)
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.play_circle,
                        color: AppColors.redColor,
                        size: 30,
                      ),
                      BuildText.buildText(
                          text: "How To Play? ", color: Colors.grey)
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.settings,
                        color: AppColors.redColor,
                        size: 30,
                      ),
                      BuildText.buildText(text: "Settings", color: Colors.grey)
                    ],
                  ),
                ]),
          ),
          body: TabBarView(children: [
            SelectGameType(),
            VideoTutorialsScreen(),
            VideoTutorialsScreen(),
          ]),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.videogame_asset_outlined,
    Icons.slow_motion_video_outlined,
    Icons.person_rounded,
  ];
}
