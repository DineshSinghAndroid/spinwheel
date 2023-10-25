import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spinwheel/app/Views/spinController.dart';

import '../../Controller/Helper/BuildText/BuildText.dart';
import '../../Controller/ProjectController/GameScreenMainController/game_screen_main_controller.dart';
import '../../Controller/Utils/Colors/custom_color.dart';
import '../../Controller/Utils/StringDefine/StringDefine.dart';

class GameScreenMain extends StatelessWidget {
  GameScreenMain({super.key});

  GameScreenMainController _gameCtrl = Get.put(GameScreenMainController());
  WheelSpinController wheelSpinController = WheelSpinController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _gameCtrl,
      builder: (controller) {
        return Scaffold(
            appBar: PreferredSize(
              child: SafeArea(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: AppColors.blueColorApp),
                  child: Row(
                    children: [BuildText.buildText(text: "Spinner Satish Ji")],
                  ),
                ),
              ),
              preferredSize: Size(Get.width, 90),
            ),
            body: Center(
              child: Column(
                children: [
                  WheelSpin(
                    controller: wheelSpinController,
                    pathImage: 'assets/images/spin2.png',
                    withWheel: 300,
                    pieces: 6,
                    // speed: 500,//defuaft is 500
                    isShowTextTest: true,
                    // offset: 1 / (10 * 6), //random 1/10 pieces defuaft is zero
                  ),
                  TextButton(
                      onPressed: () {
                        wheelSpinController.startWheel!();
                      },
                      child: Text("Start")),
                  TextButton(
                      onPressed: () {
                        wheelSpinController.stopWheel!(2);
                      },
                      child: const Text("Stop"))
                ],
              ),
            ));
      },
    );
  }
}
