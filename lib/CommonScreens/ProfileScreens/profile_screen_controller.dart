import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinwheel/Controller/ApiController/ApiController.dart';
import 'package:spinwheel/Controller/ApiController/WebConstant.dart';
import 'package:spinwheel/Controller/Helper/Shared%20Preferences/SharedPreferences.dart';
import 'package:spinwheel/main.dart';

import '../../Controller/Utils/Utils.dart';
import '../../Models/adminModels/ProfleModel.dart';

class HomeProfileScreenController extends GetxController{
ApiControllerAdmin _adminApiCtrl = ApiControllerAdmin();

@override
  void onInit() {
print("Profile controller initialosed");
  getHomeScreenData();
     // TODO: implement onInit
    super.onInit();
  }

  /// get home screen data
  ProfileDataModelHome? profileData;

  Future<ProfileDataModelHome?> getHomeScreenData({
    BuildContext ?context,
  }) async {
    changeEmptyValue(false);
    changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, dynamic> dictparm = {
      "cookie" : authToken.toString()??""
    };

    String url = WebApiConstantAdmin.GET_PROFILE_DATA;

    await _adminApiCtrl
        .getprofileDataApi(
        context: context, url: url, token: '', dictData: dictparm)
        .then((result) async {
      if (result != null) {
        try {
          if (result.error != true) {
            profileData = result;

            Utils.printLog("Profile Screen Status is :::::::;${result.message}");
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