import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinwheel/Controller/ApiController/ApiController.dart';
import 'package:spinwheel/Controller/ApiController/WebConstant.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';

import '../../Controller/RouteController/RouteNames.dart';
import '../../Controller/Utils/Utils.dart';
import '../../Models/superAdminModels/SuperAdminHomeDataModel.dart';

class AppHomeScreenController extends GetxController {
  ApiControllerSuperAdmin _superApiCtrl = ApiControllerSuperAdmin();
  @override
  void onInit() {
     getHomeScreenData();
    // TODO: implement onInit
    super.onInit();


  }
  List gameImages = [
    kMegaLudoOnline,
    kludoBoardOffline,
    kJackpot1,
    kColorPrediction,
    kSpinwheel,
    // kAviator,
    kSnackladde,
  ];
  List topSliderImages = [kPlayAndWiin, khomebanner2, kPlayAndWiin];
  List textSlider = [
    "Rahul won 18000 By Playing Ludo,  Ram won 52000 By Playing Ludo  Shree won 5224 By Playing Ludo,  Jyoti won 4213 By Playing Lud  Suman won 6242 By Playing Ludo,  Raj won 2121 By Playing Ludo,",
  ];


  onGameTap({required int index}) {
    print(index);
    if (index == 1) {
      Get.toNamed(ludoGameHomeScreen);
    }

    // else if (index == 2) {
    //   // Get.toNamed(colorPredictionGame);
    // }
    //
    ///jackpot game
    else if (index == 3) {
      Get.toNamed(jackpotGameScreen);
    } else if (index == 4) {
      Get.toNamed(colorPredictionGame);
    }

    ///Ludo offline
    else if (index == 2) {
      Get.toNamed(ludoOfflineGameOnboardingScreen);
    } else {
      Get.snackbar(
          "Coming Soon", "This game is yet in development, will available soon",
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    }
  }








  /// get home screen data
  SuperAdminHomeDataMode? homeData;

  Future<SuperAdminHomeDataMode?> getHomeScreenData({
      BuildContext ?context,
  }) async {
    changeEmptyValue(false);
    changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, dynamic> dictparm = {
      "client_key" : "ck_Nl8yMy0xMS0wOF8hUUBXI0UkUiVUXlkmVSpJKE8pUA==",
      "secret_key" : "sk_Nl8yMy0xMS0wOF8pUChPKkkmVV5ZJVQkUiNFQFchUQ=="
    };

    String url = WebApiConstantSuperAdmin.GET_HOME_DATA_URL;

    await _superApiCtrl
        .getHomeDataApi(
        context: context, url: url, token: '', dictData: dictparm)
        .then((result) async {
      if (result != null) {
        try {
          if (result.error != true) {
            homeData = result;

            Utils.printLog("Status is :::::::;${result.message}");
            ToastCustom.showToast(msg: result.message??"");

            changeLoadingValue(false);
            changeSuccessValue(true);
          } else {
            Utils.printLog(result.message);
            ToastCustom.showToast(msg: result.message.toString() ?? "");

            changeLoadingValue(false);
            changeSuccessValue(false);
          }
        } catch (_) {
          Utils.printLog("Exception : $_");
          ToastCustom.showToast(msg: result.message ?? "");
          changeSuccessValue(false);
          changeLoadingValue(false);
          changeErrorValue(true);
        }
      } else {
        changeSuccessValue(false);
        changeLoadingValue(false);
        changeErrorValue(true);
      }
    });
    update();
  }

  void changeSuccessValue(bool value) {
    isSuccess = value;
    update();
  }

  void changeLoadingValue(bool value) {
    isLoading = value;
    update();
  }

  void changeEmptyValue(bool value) {
    isEmpty = value;
    update();
  }

  void changeNetworkValue(bool value) {
    isNetworkError = value;
    update();
  }

  void changeErrorValue(bool value) {
    isError = value;
    update();
  }
  bool isError = false;
  bool isLoading = false;
  bool isEmpty = false;
  bool isNetworkError = false;
  bool isSuccess = false;
}


