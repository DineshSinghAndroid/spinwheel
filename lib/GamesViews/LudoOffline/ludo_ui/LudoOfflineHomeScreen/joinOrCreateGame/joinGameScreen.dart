import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/ButtonCustom.dart';
import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';

import '../../../../../Controller/Helper/BuildText/BuildText.dart';
import '../../../../../Controller/Utils/Colors/custom_color.dart';
import 'ludo_join_game_controller.dart';

class JoinGameScreenLudo extends StatelessWidget {
  JoinGameScreenLudo({super.key});

  final LudoJoinGameControlller _joinCtrl = Get.put(LudoJoinGameControlller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _joinCtrl,
      builder: (controller) {
      return Scaffold(
        body: LoadScreen(
            widget: Container(
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  Visibility(
                    visible: _joinCtrl.userCreatedMatchModel?.data == null ? true :false,

                    child: Container(

                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.green.withOpacity(0.5)),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                          MaterialButton(onPressed: (){
                            _joinCtrl.getOpenMatchesList();
                          },child: Text("Test"),)
                          ,
                          Container(
                            width: 120,
                            height: 50,
                            child: NeoPopTiltedButton(
                              isFloating: true,
                              onTapUp: () {},
                              onTapDown: () => _joinCtrl.onTapCreateGame(
                                context: context,
                                amount:_joinCtrl.dropDownValue.toString()
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
                  ),Visibility(
                    visible: _joinCtrl.userCreatedMatchModel?.data != null ? true :false,

                    child: Container(
          width: Get.width,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.green.withOpacity(0.5)),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        children: [
                          BuildText.buildText(
                              text: "Waiting for Player",
                              color: Colors.black,
                              weight: FontWeight.w500,
                              size: 18),
                          buildSizeBox(10.0, 0.0),
                          Container(
                            padding: EdgeInsets.only(left:10),
                            width: Get.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(radius: 30,backgroundColor: AppColors.colorAccent,backgroundImage: AssetImage(
                                      kludoBoardOffline
                                    ),

                                      ),
                                    buildSizeBox(4.0, 0.0),
                                    BuildText.buildText(text: _joinCtrl.userCreatedMatchModel?.data?.host?.name??"",color: Colors.black),
                                    BuildText.buildText(text: "@${_joinCtrl.userCreatedMatchModel?.data?.host?.username}"??"",color: Colors.black,size: 10),

                                  ],
                                ),
                                Column(
                                  children: [
                                    BuildText.buildText(text: "Finding Player",color: Colors.black),
                                    BuildText.buildText(text: "------------"),
                                  ],
                                )
                                ,
                                _joinCtrl.userCreatedMatchModel?.data?.join == null?
                                Lottie.asset(kLudosearching,width: 100):
                                Column(
                                  children: [
                                    CircleAvatar(radius: 30,backgroundColor: AppColors.colorAccent,backgroundImage: AssetImage(
                                        kludoBoardOffline
                                    ),

                                    ),
                                    buildSizeBox(4.0, 0.0),
                                    BuildText.buildText(text: _joinCtrl.userCreatedMatchModel?.data?.join?.name??"",color: Colors.black),
                                    BuildText.buildText(text: "@${_joinCtrl.userCreatedMatchModel?.data?.join?.username}"??"",color: Colors.black,size: 10),

                                  ],
                                ),

                              ],
                            ),
                          )
                          ,
                          buildSizeBox(10.0, 0.0),
                          Container(
                            width: 120,
                            height: 50,
                            child: NeoPopTiltedButton(
                              isFloating: true,
                              onTapUp: () {},
                              onTapDown: () =>_joinCtrl.userCreatedMatchModel?.data?.join == null?
                              _joinCtrl.onTapCancelMatch(
                                context: context,
                              ):_joinCtrl.onTapStartMatch(
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
                                      text:_joinCtrl.userCreatedMatchModel?.data?.join == null?  'Cancel':"Start",
                                      color: Colors.black,
                                      weight: FontWeight.w700)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      // physics: ScrollPhysics(),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: _joinCtrl.openMatchesListData?.data?.length??0,
                      itemBuilder: (BuildContext c, int i) {
                        return AnimationConfiguration.staggeredList(
                          position: i,
                          delay: const Duration(milliseconds: 100),
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeOutQuint,
                            horizontalOffset: 30,
                            verticalOffset: 300.0,
                            child: FlipAnimation(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                              flipAxis: FlipAxis.y,
                              child: Container(
                                width: Get.width,
                                margin: const EdgeInsets.only(bottom: 20),
                                // height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
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
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                          )),
                                      height: 120,
                                    ),
                                    buildSizeBox(00.00, 10.0),
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      width: Get.width / 1.2,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: BuildText.buildText(
                                                text: "Ludo Classic",
                                                size: 18,
                                                color: Colors.black,
                                                weight: FontWeight.w600),
                                          ),
                                          buildSizeBox(5.0, 0.0),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              BuildText.buildText(
                                                  text: "INR ${_joinCtrl.openMatchesListData?.data?[i].amount??""} (fee)",
                                                  size: 14,
                                                  color: Colors.black,
                                                  weight: FontWeight.w600),

                                              BuildText.buildText(
                                                  text: "INR ${_joinCtrl.openMatchesListData?.data?[i].amount??""} (win)",
                                                  size: 14,
                                                  color: Colors.black,
                                                  weight: FontWeight.w600),
                                            ],
                                          ),
                                          buildSizeBox(5.0, 0.0),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(radius: 30,backgroundImage: AssetImage(kludoBoardOffline),)
                                                  ,
                                                  buildSizeBox(0.0, 4.0),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      BuildText.buildText(text: "Dinesh Singh",size: 12,color: Colors.black)
                                                      ,
                                                      buildSizeBox(2.0, 0.0),
                                                      BuildText.buildText(text: "@username",size: 10,color: Colors.black)
                                                       ,
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    side: BorderSide(
                                                        color:
                                                        AppColors.redColor)),
                                                onPressed: () {
                                                  _joinCtrl.onTapJoinMatch(matchId:_joinCtrl.openMatchesListData?.data?[i].id??"");
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
                                    const Spacer(),
                                    Container(
                                      height: 120,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 5),
                                      width: 15,
                                      decoration: BoxDecoration(
                                          color: AppColors.redColor,
                                          borderRadius: const BorderRadius.only(
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
    },);
  }
}
