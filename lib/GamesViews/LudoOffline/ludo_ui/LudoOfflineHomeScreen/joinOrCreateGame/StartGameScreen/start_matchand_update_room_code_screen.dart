import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spinwheel/Controller/Helper/BuildText/BuildText.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/ButtonCustom.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';
import 'package:spinwheel/Controller/Utils/Utils.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/LudoOfflineHomeScreen/joinOrCreateGame/StartGameScreen/start_room_and_udpateCode_controller.dart';

import '../../../../../../Controller/Utils/contactUs.dart';

class StartMatchandUpdateRoomCodeScreen extends StatelessWidget {
  StartMatchandUpdateRoomCodeScreen({super.key});

  final StartMatchandUpdateRoomCodeController _startMatchCtrl = Get.put(StartMatchandUpdateRoomCodeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _startMatchCtrl,
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: InkWell(
            onTap: () {},
            child: Container(
              width: Get.width,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: BuildText.buildText(text: "Start Match", color: Colors.white, size: 18, weight: FontWeight.w600),
              ),
            ),
          ),
          floatingActionButton: Contactus.contactUsFloatingButton(),
          appBar: CustomAppBar(text: "Update Room Code"),
          body: LoadScreen(
            widget: SafeArea(
                child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///Player Details
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 8.0,
                        ),
                      ], borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.red),
                            width: Get.width,
                            height: 40,
                            child: Center(child: BuildText.buildText(text: "Player Details", size: 18, weight: FontWeight.w900, color: Colors.white)),
                          ),
                          buildSizeBox(8.0, 0.0),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [BuildText.buildText(text: "Player 1 Vs Player 2", color: Colors.black, size: 17)],
                                ),
                                buildSizeBox(8.0, 0.0),
                                Divider(
                                  height: 3,
                                  color: Colors.grey,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                buildSizeBox(8.0, 0.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [Lottie.asset(kCoinsLottie, height: 50), BuildText.buildText(text: "  Win Amount", color: Colors.black, size: 12), Spacer(), BuildText.buildText(text: "INR 500   ", color: Colors.black, size: 18)],
                                ),
                                buildSizeBox(8.0, 0.0),
                                Divider(
                                  height: 3,
                                  color: Colors.grey,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                buildSizeBox(30.0, 0.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [Lottie.asset(kWheellottieLottie, height: 50), BuildText.buildText(text: "Game Number", color: Colors.black, size: 12), Spacer(), BuildText.buildText(text: "LOF1203   ", color: Colors.black, size: 18)],
                                ),
                                buildSizeBox(8.0, 0.0),
                                Divider(
                                  height: 3,
                                  color: Colors.grey,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                buildSizeBox(30.0, 0.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Lottie.asset(kLoadingLottie, height: 50),
                                    BuildText.buildText(text: "Room Code", color: Colors.black, size: 12),
                                    Spacer(),
                                    Column(
                                      children: [
                                        BuildText.buildText(text: "2323232", weight: FontWeight.w900, color: Colors.black, size: 20),
                                        buildSizeBox(8.0, 0.0),
                                        InkWell(
                                          onTap: () {
                                            ToastCustom.showToastWithGravity(msg: "Room Code Copied");
                                          },
                                          child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                color: Colors.orange,
                                              ),
                                              child: BuildText.buildText(text: "Copy & Play")),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          buildSizeBox(8.0, 0.0)
                        ],
                      ),
                    ),
                    buildSizeBox(30.0, 0.0),

                    ///Result Status
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 8.0,
                        ),
                      ], borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.red),
                            width: Get.width,
                            height: 40,
                            child: Center(child: BuildText.buildText(text: "Player Details", size: 18, weight: FontWeight.w900, color: Colors.white)),
                          ),
                          buildSizeBox(8.0, 0.0),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    BuildText.buildText(text: "I Won", size: 16, color: Colors.grey, weight: FontWeight.w900),
                                    Spacer(),
                                    Checkbox(value: _startMatchCtrl.iWonCheckValue, activeColor: Colors.green, onChanged: (v) => _startMatchCtrl.onTapIWonCheckBox(v)),
                                  ],
                                ),
                                buildSizeBox(8.0, 0.0),
                                Divider(
                                  height: 3,
                                  color: Colors.grey,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                buildSizeBox(8.0, 0.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    BuildText.buildText(text: "I Loss", size: 16, color: Colors.grey, weight: FontWeight.w900),
                                    Spacer(),
                                    Checkbox(value: _startMatchCtrl.iLossCheckValue, activeColor: Colors.green, onChanged: (v) => _startMatchCtrl.onTapILossCheckBox(v)),
                                  ],
                                ),
                                Divider(
                                  height: 3,
                                  color: Colors.grey,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                buildSizeBox(8.0, 0.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    BuildText.buildText(text: "Request Cancel", size: 16, color: Colors.grey, weight: FontWeight.w900),
                                    Spacer(),
                                    Checkbox(value: _startMatchCtrl.cancelCheckValue, activeColor: Colors.green, onChanged: (v) => _startMatchCtrl.onTapCancelCheckBox(v)),
                                  ],
                                ),
                                buildSizeBox(8.0, 0.0),
                                if (_startMatchCtrl.cancelCheckValue == true) buildSizeBox(10.0, 0.0),
                                if (_startMatchCtrl.cancelCheckValue == true)
                                  DropdownButtonFormField<String>(
                                    value: _startMatchCtrl.reasonDropdownValue,
                                    decoration: const InputDecoration(labelText: "Select Reason", border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                                    items: _startMatchCtrl.reasonDropdownList.map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) => _startMatchCtrl.onTapReasonDropDown(value: value),
                                  ),
                                buildSizeBox(20.0, 0.0),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: ButtonCustom(
                                      onPress: () {},
                                      text: "Submit",
                                      buttonHeight: 40,
                                      buttonWidth: 120,
                                      backgroundColor: Colors.green,
                                    )),
                              ],
                            ),
                          ),
                          buildSizeBox(8.0, 0.0)
                        ],
                      ),
                    ),
                    buildSizeBox(40.0, 0.0),
                  ],
                ),
              ),
            )),
            isLoading: _startMatchCtrl.isLoading,
          ),
        );
      },
    );
  }
}
