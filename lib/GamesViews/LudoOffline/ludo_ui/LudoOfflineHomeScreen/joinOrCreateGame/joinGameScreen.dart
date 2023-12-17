import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/ButtonCustom.dart';
import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';

import '../../../../../Controller/Helper/BuildText/BuildText.dart';
import '../../../../../Controller/Utils/Colors/custom_color.dart';
import 'ludo_join_game_controller.dart';

class JoinGameScreenLudo extends StatelessWidget {
  JoinGameScreenLudo({super.key});

  final LudoJoinGameControlller _joinCtrl = Get.put(LudoJoinGameControlller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadScreen(
          widget: Container(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.green.withOpacity(0.5)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      BuildText.buildText(
                          text: "Create Game",
                          color: Colors.black,
                          weight: FontWeight.w900,
                          size: 20),
                      buildSizeBox(10.0, 0.0),
                      Container(
                        width: 400,
                        // height: 50,
                        child: DropdownButtonFormField<String>(
                          value: _joinCtrl.dropDownValue,
                          decoration: const InputDecoration(
                              labelText: "Select Amount",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          items: _joinCtrl.dropDownValueList
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            _joinCtrl.dropDownValue = value!;
                            _joinCtrl.update();
                          },
                        ),
                      ),
                      buildSizeBox(10.0, 0.0),
                      Container(
                        width: 120,
                        height: 50,
                        child: NeoPopTiltedButton(
                          isFloating: true,
                          onTapUp: () => _joinCtrl.onTapPlayNow(
                            context: context,
                          ),
                          onTapDown: () => _joinCtrl.onTapPlayNow(
                            context: context,
                          ),
                          decoration: const NeoPopTiltedButtonDecoration(
                            color: Color.fromRGBO(255, 235, 52, 1),
                            plunkColor: Color.fromRGBO(255, 235, 52, 1),
                            shadowColor: Color.fromRGBO(36, 36, 36, 1),
                            showShimmer: true,
                          ),
                          child: Center(
                              child: BuildText.buildText(
                                  text: 'Create',
                                  color: Colors.black,
                                  weight: FontWeight.w700)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    // physics: ScrollPhysics(),
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: _joinCtrl.progressValue.length,
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
                                    padding: EdgeInsets.symmetric(vertical: 10),
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
                                              MainAxisAlignment.spaceBetween,
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
                                              child: LinearProgressIndicator(
                                                value:
                                                    _joinCtrl.progressValue[i],
                                                // value: .5,
                                                minHeight: 5.0,
                                                // Optional: Set the height of the progress bar
                                                backgroundColor:
                                                    Colors.grey[300],
                                                // Optional: Set the background color
                                                valueColor: AlwaysStoppedAnimation<
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
                                                      color:
                                                          AppColors.redColor)),
                                              onPressed: () {
                                                _joinCtrl.getCreatedMatchData();
                                              },
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
                                                MainAxisAlignment.spaceBetween,
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
              ],
            ),
          ),
          isLoading: _joinCtrl.isLoading),
    );
  }
}
