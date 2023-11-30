import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Controller/Helper/BuildText/BuildText.dart';
import '../../../../Controller/Utils/Colors/custom_color.dart';
import 'ludo_offline_homescreen_controller.dart';

class SelectGameType extends StatelessWidget {
  SelectGameType({Key? key}) : super(key: key);
  final LudoOfflineHomeScreenController _appCtrl =
  Get.put(LudoOfflineHomeScreenController());

  List progressValue = [
    .10,
    .10,
    .20,
    .20,
    .30,
    .30,
    .40,
    .40,
    .50,
    .50,
    .10,
    .10,
    .20,
    .20,
    .30,
    .30,
    .40,
    .40,
    .50,
    .50,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 50),
        child: Container(
          decoration: BoxDecoration(color: Colors.green),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    buildSizeBox(0.0, 20.0),
                    BuildText.buildText(
                        text: "Mama Ludo", size: 28, weight: FontWeight.w900),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notification_add,
                          color: AppColors.whiteColor,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        // initialIndex: 1,
        length: 3,
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.green),
              child: TabBar(
                  isScrollable: false,
                  indicatorPadding: const EdgeInsets.only(top: 10, bottom: 0),
                  indicatorColor: AppColors.whiteColor,
                  unselectedLabelColor: Colors.white,
                  labelColor: AppColors.whiteColor,
                  dividerColor: AppColors.transparentColor,
                  labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                  indicatorSize: TabBarIndicatorSize.tab,
                  automaticIndicatorColorAdjustment: true,
                  indicatorWeight: 3,
                  unselectedLabelStyle: const TextStyle(color: Colors.white),
                  tabs: [
                    BuildText.buildText(
                        text: "JOIN",
                        color: Colors.white,
                        weight: FontWeight.w900),
                    BuildText.buildText(
                        text: "RUNNING",
                        color: Colors.white,
                        weight: FontWeight.w900),
                    BuildText.buildText(
                        text: "COMPLETED",
                        color: Colors.white,
                        weight: FontWeight.w900),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AnimationLimiter(
                    child: Container(
                      width: Get.width,
                      height: Get.height,
                      child: ListView.builder(
                        padding:
                        EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: progressValue.length,
                        itemBuilder: (BuildContext c, int i) {
                          return AnimationConfiguration.staggeredList(
                            position: i,
                            delay: Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeOutQuint,
                              horizontalOffset: 30,
                              verticalOffset: 300.0,
                              child: FlipAnimation(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                                flipAxis: FlipAxis.y,
                                child: Container(
                                  width: Get.width,
                                  margin: EdgeInsets.only(bottom: 20),
                                  // height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 40,
                                        spreadRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 5,
                                        decoration: BoxDecoration(
                                            color: AppColors.redColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                            )),
                                        height: 120,
                                      ),
                                      buildSizeBox(00.00, 10.0),
                                      Container(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 10),
                                        width: Get.width / 1.2,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            BuildText.buildText(
                                                text: "PLAYER 1 VS PLAYER 2",
                                                size: 12,
                                                color: Colors.black,
                                                weight: FontWeight.w600),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                BuildText.buildText(
                                                    text: "INR 15.0 (win)",
                                                    size: 14,
                                                    color: Colors.black,
                                                    weight: FontWeight.w600),
                                                BuildText.buildText(
                                                    text: "INR 10.0 (fee)",
                                                    size: 14,
                                                    color: Colors.black,
                                                    weight: FontWeight.w600),
                                              ],
                                            ),
                                            buildSizeBox(5.0, 0.0),
                                            Row(
                                              children: [
                                                Container(
                                                  width: Get.width / 1.9,
                                                  height: 5,
                                                  child:
                                                  LinearProgressIndicator(
                                                    value: progressValue[i],
                                                    // value: .5,
                                                    minHeight: 5.0,
                                                    // Optional: Set the height of the progress bar
                                                    backgroundColor:
                                                    Colors.grey[300],
                                                    // Optional: Set the background color
                                                    valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                        Colors
                                                            .green), // Optional: Set the progress color
                                                  ),
                                                ),
                                                Spacer(),
                                                MaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(5),
                                                      ),
                                                      side: BorderSide(
                                                          color: AppColors
                                                              .redColor)),
                                                  onPressed: () {},
                                                  child: BuildText.buildText(
                                                      text: "Join",
                                                      color: Colors.pink,
                                                      weight: FontWeight.w400),
                                                )
                                              ],
                                            ),
                                            // buildSizeBox(2.0, 0.0),
                                            Container(
                                              width: 200,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  BuildText.buildText(
                                                      text: "Created at 23:33",
                                                      size: 8,
                                                      color: Colors.grey,
                                                      weight: FontWeight.w600),
                                                  BuildText.buildText(
                                                      text: "Player: 0/2",
                                                      size: 8,
                                                      color: Colors.grey,
                                                      weight: FontWeight.w600),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 120,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2, vertical: 5),
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: AppColors.redColor,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                            )),
                                        child: BuildText.buildText(
                                            text: "SINGLE", size: 12),
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
                        padding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: 20,
                        itemBuilder: (BuildContext c, int i) {
                          return AnimationConfiguration.staggeredList(
                            position: i,
                            delay: Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              horizontalOffset: 30,
                              verticalOffset: 300.0,
                              child: FlipAnimation(
                                duration: Duration(milliseconds: 3000),
                                curve: Curves.fastLinearToSlowEaseIn,
                                flipAxis: FlipAxis.y,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
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
                        padding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: 20,
                        itemBuilder: (BuildContext c, int i) {
                          return AnimationConfiguration.staggeredList(
                            position: i,
                            delay: Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              horizontalOffset: 30,
                              verticalOffset: 300.0,
                              child: FlipAnimation(
                                duration: Duration(milliseconds: 3000),
                                curve: Curves.fastLinearToSlowEaseIn,
                                flipAxis: FlipAxis.y,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
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
    );
  }
}
