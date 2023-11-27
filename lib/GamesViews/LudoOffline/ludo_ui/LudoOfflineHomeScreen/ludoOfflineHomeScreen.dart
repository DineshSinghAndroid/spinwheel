import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/play_online/playerOnline.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/play_online/table_play.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/reusable/StringUtils.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/reusable/background-widget.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/reusable/colors_utils.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/reusable/custom_progress.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/store/store.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/wallet/wallet.dart';

import '../../../../Controller/Helper/BuildText/BuildText.dart';
import '../../../../Controller/ProjectController/common/app_homescreen_controller.dart';
import '../../../../Controller/Utils/Colors/custom_color.dart';
import '../../../../Controller/Utils/StringDefine/StringDefine.dart';
import '../leaderboard/leaderboard.dart';
import 'ludo_offline_homescreen_controller.dart';

class SelectGameType extends StatelessWidget {
  SelectGameType({Key? key}) : super(key: key);
  final LudoOfflineHomeScreenController _appCtrl =
      Get.put(LudoOfflineHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Ludo Classic"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // const BackgroundImageWidget(
              //   isLogo: false,
              // ),

              Container(
                height: Get.height,
                width: Get.width,
                child: Lottie.asset(kBackgoundhomeLottie, fit: BoxFit.cover),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        enlargeCenterPage: false,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        pageSnapping: true,
                        aspectRatio: 6 / 3),
                    items: _appCtrl.topSliderImages.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(i), fit: BoxFit.cover)),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    color: AppColors.transparentColor,
                    height: 700,
                    width: Get.width,
                    child: DefaultTabController(
                      // initialIndex: 1,
                      length: 3,
                      child: Scaffold(
                        body: Container(
                          height: Get.height,
                          width: Get.width,
                          child: Column(
                            children: [
                              TabBar(
                                  isScrollable: false,
                                  indicatorPadding:
                                      const EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  indicatorColor: AppColors.primaryColor,
                                  unselectedLabelColor: Colors.grey,
                                  labelColor: AppColors.primaryColor,
                                  automaticIndicatorColorAdjustment: true,
                                  unselectedLabelStyle:
                                      const TextStyle(color: Colors.grey),
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  tabs: [
                                    BuildText.buildText(
                                        text: "Create New",
                                        color: Colors.black),
                                    BuildText.buildText(
                                        text: "Join Match",
                                        color: Colors.black),
                                    BuildText.buildText(
                                        text: "Running", color: Colors.black),
                                  ]),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: TablePlay(),
                                    ),
                                    AnimationLimiter(
                                      child: Container(
                                        height: 500,
                                        child: ListView.builder(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 10),
                                          physics: BouncingScrollPhysics(
                                              parent:
                                                  AlwaysScrollableScrollPhysics()),
                                          itemCount: 20,
                                          itemBuilder: (BuildContext c, int i) {
                                            return AnimationConfiguration
                                                .staggeredList(
                                              position: i,
                                              delay:
                                                  Duration(milliseconds: 100),
                                              child: SlideAnimation(
                                                duration: Duration(
                                                    milliseconds: 2500),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                horizontalOffset: 30,
                                                verticalOffset: 300.0,
                                                child: FlipAnimation(
                                                  duration: Duration(
                                                      milliseconds: 3000),
                                                  curve: Curves
                                                      .fastLinearToSlowEaseIn,
                                                  flipAxis: FlipAxis.y,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 20),
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          blurRadius: 40,
                                                          spreadRadius: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    AnimationLimiter(
                                      child: Container(
                                        height: 500,
                                        child: ListView.builder(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 10),
                                          physics: BouncingScrollPhysics(
                                              parent:
                                                  AlwaysScrollableScrollPhysics()),
                                          itemCount: 20,
                                          itemBuilder: (BuildContext c, int i) {
                                            return AnimationConfiguration
                                                .staggeredList(
                                              position: i,
                                              delay:
                                                  Duration(milliseconds: 100),
                                              child: SlideAnimation(
                                                duration: Duration(
                                                    milliseconds: 2500),
                                                curve: Curves
                                                    .fastLinearToSlowEaseIn,
                                                horizontalOffset: 30,
                                                verticalOffset: 300.0,
                                                child: FlipAnimation(
                                                  duration: Duration(
                                                      milliseconds: 3000),
                                                  curve: Curves
                                                      .fastLinearToSlowEaseIn,
                                                  flipAxis: FlipAxis.y,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 20),
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(20),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          blurRadius: 40,
                                                          spreadRadius: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
