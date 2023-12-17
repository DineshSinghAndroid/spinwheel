import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:spinwheel/Controller/ApiController/ApiController.dart';
import 'package:spinwheel/Controller/ApiController/WebConstant.dart';
import 'package:spinwheel/main.dart';

import '../../../../../Controller/Utils/Utils.dart';
import '../../../../../Models/gamesModel/LudoOfflineModels/CreateGameModel.dart';
import '../../../../../Models/gamesModel/LudoOfflineModels/UserCreatedMatchModel.dart';

class LudoJoinGameControlller extends GetxController {
  final ApiControllerGames _gameApiCtrl = ApiControllerGames();
  bool isLoading = false;

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

  ///Voltage level
  String dropDownValue = "20";
  List<String> dropDownValueList = <String>[
    "20",
    "50",
    "100",
    "200",
    "500",
    "1000",
    "2000",
    "5000",
    "8000",
  ];

  onTapCreateGame({
    required BuildContext context,
  }) {
    createGame();
  }

  /// Create Match
  CreateLudoGameModel? createLudoGameModel;

  Future<CreateLudoGameModel?> createGame({
    BuildContext? context,
  }) async {
    changeEmptyValue(false);
    changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, dynamic> dictparm = {
      "cookie": authToken,
      "amount": "20",
      "match": "1"
    };

    String url = WebApiConstantGames.CREATE_LUDO_GAME;

    await _gameApiCtrl
        .createLudoGame(
            context: context, url: url, token: '', dictData: dictparm)
        .then((result) async {
      if (result != null) {
        try {
          if (result.error != true) {
            createLudoGameModel = result;

            Utils.printLog("create game status is  :::::::;${result.message}");
            ToastCustom.showToast(msg: result.message ?? "");

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

  /// User Created Matchs
  UserCreatedMatchModel? userCreatedMatchModel;

  Future<UserCreatedMatchModel?> getCreatedMatchData({
    BuildContext? context,
  }) async {
    changeEmptyValue(false);
    changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, String> dictparm = {
      "cookie": authToken.toString(),
    };

    String url = WebApiConstantGames.USER_CREATED_MATCHES_API;

    await _gameApiCtrl
        .userCreatedMatchesApi(
            context: context, url: url, token: '', dictData: dictparm)
        .then((result) async {
      if (result != null) {
        try {
          if (result.error != true) {
            userCreatedMatchModel = result;

            Utils.printLog(
                "userCreatedMatchModel status is  :::::::;${result.message}");
            ToastCustom.showToast(msg: result.message ?? "");

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
  bool isEmpty = false;
  bool isNetworkError = false;
  bool isSuccess = false;
}
