import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:spinwheel/Controller/Utils/Colors/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';
import 'package:spinwheel/Controller/Utils/Utils.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../Controller/Helper/BuildText/BuildText.dart';
import 'app_homescreen_controller.dart';
import '../../Controller/Utils/StringDefine/StringDefine.dart';
import '../../GamesViews/ColorPrediction/color_prediction_controller.dart';
import '../../GamesViews/LudoOnlineWebview/ludoHomeScreenController.dart';
import '../ProfileScreens/ProfileScreen.dart';

class AppHomeScreen extends StatelessWidget {
  AppHomeScreen({super.key});

  final AppHomeScreenController _appCtrl = Get.put(AppHomeScreenController());

  ///Initialise ludo ctrl here
  final LudoHomeScreenController _ludoGameCtrl =
      Get.put(LudoHomeScreenController());
  final ColorPredictionHomeScreenController _colorCtrl =
      Get.put(ColorPredictionHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (v) {
          ToastCustom.showToast(
            msg: "Please Continue Playing",
          );
        },
        canPop: false,
        child: GetBuilder(
          init: _appCtrl,
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.purpleColor,
                title: BuildText.buildText(text: "Mama Ludo"),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.volume_down)),
                  buildSizeBox(0.0, 5.0),
                  IconButton(onPressed: () {}, icon: Icon(Icons.info_outline)),
                  buildSizeBox(0.0, 5.0),
                ],
              ),

              ///profile screen comment
              drawer: Container(width: Get.width / 1.2, child: ProfileScreen()),
              backgroundColor: AppColors.scaffoldBackgroundColor,
              body: LoadScreen(
                  widget: SingleChildScrollView(
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Container(
                            height: Get.height,
                            width: Get.width,
                            child: Lottie.asset(kBackgoundhomeLottie,
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                      enlargeCenterPage: false,
                                      viewportFraction: 1.0,
                                      enableInfiniteScroll: true,
                                      autoPlay: true,
                                      pageSnapping: true,
                                      aspectRatio: 6 / 3),
                                  items: _appCtrl.homeData?.data?.homeData?.slider?.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: Get.width,
                                          child: Image.network(
                                            i.url??'',
                                            fit: BoxFit.cover,
                                            loadingBuilder: (BuildContext context, Widget child,
                                                ImageChunkEvent? loadingProgress) {
                                              if (loadingProgress == null) return child;
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress.expectedTotalBytes != null
                                                      ? loadingProgress.cumulativeBytesLoaded /
                                                      loadingProgress.expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                buildSizeBox(10.0, 0.0),
                                Container(
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 6),
                                  decoration: BoxDecoration(color: Colors.red),
                                  child: TextScroll(
                                    _appCtrl.homeData?.data?.homeData?.footerText??"",
                                    mode: TextScrollMode.endless,
                                    velocity: Velocity(
                                        pixelsPerSecond: Offset(150, 0)),
                                    delayBefore: Duration(milliseconds: 5000),
                                    numberOfReps: 999999,
                                    pauseBetween: Duration(milliseconds: 5000),
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.right,
                                    selectable: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 250, right: 10, left: 10),
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _appCtrl.homeData?.data?.appList?.length??0,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () =>
                                      _appCtrl.onGameTap(index: index + 1),
                                  child: Container(
                                    height: 160,
                                    width: 230,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),

                                    child:  Image.network(
                                      _appCtrl.homeData?.data?.appList?[index].appImage.toString()??"",
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context, Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isLoading: _ludoGameCtrl.isLoading.value),
            );
          },
        ));
  }
}
