import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:spinwheel/Controller/Utils/contactUs.dart';

import '../../../../Controller/Helper/BuildText/BuildText.dart';
import '../../../../Controller/Utils/Colors/custom_color.dart';
import '../../../../Controller/Utils/Utils.dart';
import 'joinOrCreateGame/joinGameScreen.dart';

class SelectGameType extends StatelessWidget {
  SelectGameType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Contactus.contactUsFloatingButton(),
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 80),
        child: Container(
          decoration: const BoxDecoration(color: Colors.green),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                    buildSizeBox(0.0, 10.0),
                    BuildText.buildText(
                        text: "MaMa Ludo", size: 24, weight: FontWeight.w900),
                    Spacer(),
                    ShowBalanceBoxCommon(balance: '121'),
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
                  JoinGameScreenLudo(),
                  JoinGameScreenLudo(),
                  JoinGameScreenLudo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
