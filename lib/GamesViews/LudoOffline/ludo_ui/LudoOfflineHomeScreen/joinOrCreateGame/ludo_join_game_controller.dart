import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:spinwheel/CommonScreens/ProfileScreens/profile_screen_controller.dart';
import 'package:spinwheel/Controller/ApiController/ApiController.dart';
import 'package:spinwheel/Controller/ApiController/WebConstant.dart';
import 'package:spinwheel/Controller/RouteController/RouteNames.dart';
import 'package:spinwheel/main.dart';

import '../../../../../Controller/Utils/Utils.dart';
import '../../../../../Models/gamesModel/LudoOfflineModels/CancelMatchUserCreatedModel.dart';
import '../../../../../Models/gamesModel/LudoOfflineModels/CreateGameModel.dart';
import '../../../../../Models/gamesModel/LudoOfflineModels/JoinOpenMatchesModel.dart';
import '../../../../../Models/gamesModel/LudoOfflineModels/OpenMatchesModel.dart';
import '../../../../../Models/gamesModel/LudoOfflineModels/UserCreatedMatchModel.dart';

class LudoJoinGameControlller extends GetxController {
  final ApiControllerGames _gameApiCtrl = ApiControllerGames();
  final HomeProfileScreenController homeProfileCtrl = Get.find();
  bool isLoading = false;
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    hitInEvery1Second();
  }
  RxBool showFindingPlayer = false.obs;
  late Timer _timer;

  hitInEvery1Second()async{
    userCreatedMatchModel = null;

    _timer = Timer.periodic(const Duration(seconds: 390), (Timer timer) {
      if(showFindingPlayer.value = true ){
        getCreatedMatchData().then((value) {
          if(userCreatedMatchModel == null){
            showFindingPlayer.value = false;
          }
        });

      }
       // getOpenMatchesList();
      print("Hitting in every 3 second");

     });
  }
  @override
  void dispose() {
    _timer.cancel();
    userCreatedMatchModel = null;
    print("Disposed");

    // TODO: implement dispose
    super.dispose();
  }
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
    required BuildContext context, required String amount,
  }) {
    createGame(amount: amount).then((value) => getCreatedMatchData().then((value) {
      showFindingPlayer.value = true;

    }));
  }

  ///Create Match
  CreateLudoGameModel? createLudoGameModel;

  Future<CreateLudoGameModel?> createGame({
    BuildContext? context,
    required String amount,
  }) async {
    changeEmptyValue(false);
    changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, dynamic> dictparm = {
      "cookie": authToken,
      "amount": amount.toString(),
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

void onTapJoinMatch({required String matchId}){
  joinOpenMatch(matchId: matchId);
}
  ///Join Open Matches Match
  JoinOpenMatchesModel? joinOpenMatchesModel;

  Future<JoinOpenMatchesModel?> joinOpenMatch({
    required String matchId,
    BuildContext? context,
  }) async {
    changeEmptyValue(false);
    changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, dynamic> dictparm = {
      "cookie": authToken,
      "matchid": matchId.toString()
    };

    String url = WebApiConstantGames.JOIN_OPEN_MATCHES_API;

    await _gameApiCtrl
        .joinOpenMatchApi(
            context: context, url: url, token: '', dictData: dictparm)
        .then((result) async {
      if (result != null) {
        try {
          if (result.error != true) {
            joinOpenMatchesModel = result;
             Utils.printLog("Join open match  :::::::;${result.message}");
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

  /// User Created Matches
  UserCreatedMatchModel? userCreatedMatchModel;

  Future<UserCreatedMatchModel?> getCreatedMatchData({

    BuildContext? context,
  }) async {
    // userCreatedMatchModel = null ;

    changeEmptyValue(false);
    // changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, String> dictparm = {
      "cookie": authToken,
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

            // Utils.printLog("user Created Match Model status is  :::::::;${result.message}");
            //  ToastCustom.showToast(msg: result.message?? "");

            changeLoadingValue(false);
            changeSuccessValue(true);
          } else {
            // Utils.printLog(result.message);
            // ToastCustom.showToast(msg: result.message.toString() ?? "");

            changeLoadingValue(false);
            changeSuccessValue(false);
          }
        } catch (_) {
          Utils.printLog("Exception : $_");
          // ToastCustom.showToast(msg: result.message ?? "");
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



  /// User Created Match Cancel
  UserCreatedMatchCalcelModel? cancelUserCreatedMatchData;

  Future<UserCreatedMatchCalcelModel?> cancelUserCreatedMatchApi({
    BuildContext? context, required String  matchId,
  }) async {
    changeEmptyValue(false);
    // changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, String> dictparm = {
      "cookie": authToken,
      "matchid":matchId.toString(),
      "reason":'Self Cancel created match',
    };

    String url = WebApiConstantGames.CANCEL_USER_CREATED_MATCH_API;

    await _gameApiCtrl
        .cancelUserCreatedMatchApiHit(
            context: context, url: url, token: '', dictData: dictparm)
        .then((result) async {
      if (result != null) {
        try {
          if (result.error != true) {
            cancelUserCreatedMatchData = result;

            // Utils.printLog("user Created Match Model status is  :::::::;${result.message}");
             ToastCustom.showToast(msg: result.message ?? "");

            changeLoadingValue(false);
            changeSuccessValue(true);
          } else {
            // Utils.printLog(result.message);
            // ToastCustom.showToast(msg: result.message.toString() ?? "");

            changeLoadingValue(false);
            changeSuccessValue(false);
          }
        } catch (_) {
          Utils.printLog("Exception : $_");
          // ToastCustom.showToast(msg: result.message ?? "");
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



  /// Open Matches Data
  OpenMatchesModel? openMatchesListData;

  Future<OpenMatchesModel?> getOpenMatchesList({
    BuildContext? context,
  }) async {
    changeEmptyValue(false);
    // changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, String> dictparm = {
      "cookie": authToken,
    };

    String url = WebApiConstantGames.GET_OPEN_MATCHES_LIST;

    await _gameApiCtrl
        .getOpenMatchesApi(
            context: context, url: url, token: '', dictData: dictparm)
        .then((result) async {
      if (result != null) {
        try {
          if (result.error != true) {
            openMatchesListData = result;

            // Utils.printLog("user Created Match Model status is  :::::::;${result.message}");
            // ToastCustom.showToast(msg: result.message ?? "");

            changeLoadingValue(false);
            changeSuccessValue(true);
          } else {
            // Utils.printLog(result.message);
            // ToastCustom.showToast(msg: result.message.toString() ?? "");

            changeLoadingValue(false);
            changeSuccessValue(false);
          }
        } catch (_) {
          Utils.printLog("Exception : $_");
          // ToastCustom.showToast(msg: result.message ?? "");
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

  onTapCancelMatch({required BuildContext context}) {
    // hitCancelMatchApi();
    cancelUserCreatedMatchApi(matchId:userCreatedMatchModel?.data?.id??"0").then((value) {
      showFindingPlayer.value = false;
      userCreatedMatchModel = null;

    });
update();

  }  onTapStartMatch({required BuildContext context}) {
     Get.toNamed(startMatchandUpdateRoomCodeScreen);


  }


}
