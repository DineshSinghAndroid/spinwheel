import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
import 'package:spinwheel/GamesViews/Spinner/spinController.dart';
import 'package:spinwheel/adminviews/sideDrawer.dart';

import '../../Controller/Helper/BuildText/BuildText.dart';
import '../../Controller/ProjectController/SpinnerControllers/GameScreenMainController/game_screen_main_controller.dart';
import '../../Controller/Utils/Colors/custom_color.dart';
import '../../Controller/Utils/StringDefine/StringDefine.dart';

class SpinnerHomeScreen extends StatelessWidget {
  SpinnerHomeScreen({super.key});

  SpinnerHomeScreenController _gameCtrl =
      Get.put(SpinnerHomeScreenController());
  WheelSpinController wheelSpinController = WheelSpinController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _gameCtrl,
      builder: (controller) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.blueColorApp,
            title: BuildText.buildText(text: "Spin N Win"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.volume_mute_rounded)),
              buildSizeBox(0.0, 5.0),
              IconButton(onPressed: () {}, icon: Icon(Icons.file_copy_rounded)),
              buildSizeBox(0.0, 5.0),
              IconButton(onPressed: () {}, icon: Icon(Icons.info_outline)),
              buildSizeBox(0.0, 5.0),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              height: Get.height / 1.1,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(kHomeBack1), fit: BoxFit.cover)),
              child: Column(
                children: [
                  WheelSpin(
                    controller: wheelSpinController,
                    pathImage: 'assets/spinner/images/spin2.png',
                    withWheel: 300,
                    pieces: 15,
                    speed: 500,
                    //defuaft is 500
                    isShowTextTest: false,
                    offset: 1 / (10 * 6), //random 1/10 pieces defuaft is zero
                  ),
                  TextButton(
                      onPressed: () {
                        wheelSpinController.startWheel();
                      },
                      child: Text("Start")),
                  TextButton(
                      onPressed: () {
                        wheelSpinController.stopWheel(15);
                      },
                      child: const Text("Stop")),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: Get.width,
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Container(
                          margin: EdgeInsets.only(right: 8),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: FittedBox(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: BuildText.buildText(
                                      text: "87454", size: 20),
                                ),
                                Lottie.asset(kCoinrainanimationLottie,
                                    height: 100),
                                Lottie.asset(kCoinsLottie, height: 50),
                                BuildText.buildText(
                                    text: "Tap to Play", color: Colors.white),
                              ],
                            ),
                          ),
                        )),
                        Flexible(
                            child: Container(
                          margin: EdgeInsets.only(right: 8),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: FittedBox(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: BuildText.buildText(
                                      text: "3434", size: 20),
                                ),
                                Lottie.asset(kCoinrainanimationLottie,
                                    height: 100),
                                Lottie.asset(kCoinsLottie, height: 50),
                                BuildText.buildText(
                                    text: "Tap to Play", color: Colors.white),
                              ],
                            ),
                          ),
                        )),
                        Flexible(
                            child: Container(
                          margin: EdgeInsets.only(right: 8),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: FittedBox(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: BuildText.buildText(
                                      text: "87454", size: 20),
                                ),
                                Lottie.asset(kCoinrainanimationLottie,
                                    height: 100),
                                Lottie.asset(kCoinsLottie, height: 50),
                                BuildText.buildText(
                                    text: "Tap to Play", color: Colors.white),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child:
                            BuildText.buildText(text: "Total Balance : 33223")),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    width: Get.width,
                    height: 80,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _gameCtrl.amountList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          child: CircleAvatar(
                            radius: 25,
                            child: BuildText.buildText(
                                text: _gameCtrl.amountList[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
