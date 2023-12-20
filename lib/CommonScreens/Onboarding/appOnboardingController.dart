import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'package:xen_popup_card/xen_popup_card.dart';

import '../../Controller/Helper/Shared Preferences/SharedPreferences.dart';
import '../../Models/adminModels/LoginModel.dart';
import '../../main.dart';
import 'loginAndSignupColumns.dart';
import '../../Models/adminModels/RegisterModel.dart';
import 'loginAndSignupColumns.dart';
import '../../Controller/ApiController/ApiController.dart';
import '../../Controller/ApiController/WebConstant.dart';
import '../../Controller/RouteController/RouteNames.dart';
import '../../Controller/Utils/Colors/custom_color.dart';
import '../../Controller/Utils/Utils.dart';

class AppOnboardingController extends GetxController {
  ApiControllerAdmin _apiCtrl = ApiControllerAdmin();

  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController userPhoneCtrl = TextEditingController();
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController userpasswordCtrl = TextEditingController();
  TextEditingController userReferCodeCtrl = TextEditingController();

  @override
  void onInit() {
    userPhoneCtrl.text = "9876543210";
    userpasswordCtrl.text = "test1234";
    checkAppUpdate();
    // TODO: implement onInit
    super.onInit();
  }
  checkAppUpdate()async{
    Upgrader.clearSavedSettings();

  }
  onTapPlayNow(context) {
    print("ON tap    Button");
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return cardWithBodyOnly(context: context);
      },
    );
  }

  Widget cardWithBodyOnly({required BuildContext context}) => XenPopupCard(
          body: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                TabBar(
                    isScrollable: false,
                    indicatorPadding: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    indicatorColor: AppColors.primaryColor,
                    unselectedLabelColor: Colors.grey,
                    labelColor: AppColors.primaryColor,
                    automaticIndicatorColorAdjustment: true,
                    unselectedLabelStyle: const TextStyle(color: Colors.grey),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    tabs: [
                      Text(
                        "Login",
                        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Register",
                        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w900),
                      ),
                    ]),
                Expanded(
                  child: TabBarView(
                    children: [
                      LoginColumn(),
                      RegisterColumn(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ));

  onTapRegister(BuildContext context) {
    if (userNameCtrl.text.isNotEmpty && userPhoneCtrl.text.isNotEmpty && userEmailCtrl.text.isNotEmpty && userpasswordCtrl.text.isNotEmpty) {
      signUpApi(context: context);
    } else {
      ToastCustom.showToast(msg: "All fields are mandatory");
    }
  }

  onTapLogin(BuildContext context) {
    if (userPhoneCtrl.text.isNotEmpty && userpasswordCtrl.text.isNotEmpty) {
      loginApi(context: context);
    } else {
      ToastCustom.showToast(msg: "All fields are mandatory");
    }
  }

  /// SIgn up api hit
  RegisterModel? registerData;

  Future<RegisterModel?> signUpApi({
    required BuildContext context,
  }) async {
    changeEmptyValue(false);
    changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, dynamic> dictparm = {
      "first_name": userNameCtrl.text.trim().toString(),
      "email": userEmailCtrl.text.trim().toString(),
      "phone": userPhoneCtrl.text.trim().toString(),
      "password": userpasswordCtrl.text.trim().toString(),
      "refer": userReferCodeCtrl.text.trim().toString(),
    };

    String url = WebApiConstantAdmin.registerUrl;

    await _apiCtrl.registerApiHit(context: context, url: url, token: '', dictData: dictparm).then((result) async {
      if (result != null) {
        try {
          if (result.error != true) {
            registerData = result;

            Utils.printLog("Status is :::::::;${result.message}");
            ToastCustom.showToast(msg: result.message ?? "");
            Get.offAllNamed(apphomeScreen);

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

  /// SIgn up api hit
  LoginModel? loginModel;

  Future<LoginModel?> loginApi({
    required BuildContext context,
  }) async {
    changeEmptyValue(false);
    changeLoadingValue(true);
    changeNetworkValue(false);
    changeErrorValue(false);
    changeSuccessValue(false);

    Map<String, dynamic> dictparm = {
      "phone": userPhoneCtrl.text.trim().toString(),
      "password": userpasswordCtrl.text.trim().toString(),
    };

    String url = WebApiConstantAdmin.loginUrl;

    await _apiCtrl.loginApiHit(context: context, url: url, token: '', dictData: dictparm).then((result) async {
      if (result != null) {
        try {
          if (result.error != true) {
            if (result.authenticated == true) {
              loginModel = result;
              await saveUserDataToSharedPrefrences(userData: result.data).then((value) {
                Get.offAllNamed(apphomeScreen);
              });
            }

            Utils.printLog("Status is :::::::${result.message}");
            ToastCustom.showToast(msg: result.message ?? "asf");

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
        ToastCustom.showToast(msg: "Something went wrong");
        changeSuccessValue(false);
        changeLoadingValue(false);
        changeErrorValue(true);
      }
    });
    update();
  }

  bool isLoading = false;
  bool isError = false;
  bool isEmpty = false;
  bool isNetworkError = false;
  bool isSuccess = false;

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

  Future saveUserDataToSharedPrefrences({LoginData? userData}) async {
    SharedPreferences.getInstance().then((value) {
      value.setString(AppSharedPreferences.username, userData?.username ?? "");

      value.setString(AppSharedPreferences.phone, userData?.phone.toString() ?? "");

      value.setString(AppSharedPreferences.email, userData?.email ?? "");

      value.setString(AppSharedPreferences.registered, userData?.registered ?? "");

      value.setString(AppSharedPreferences.displayname, userData?.displayname ?? "");

      value.setString(AppSharedPreferences.nickname, userData?.nickname ?? "");

      value.setString(AppSharedPreferences.cookieName, userData?.cookieName ?? "");

      value.setString(AppSharedPreferences.cookieAdmin, userData?.cookieAdmin ?? "");
      value.setString(AppSharedPreferences.authToken, userData?.cookie ?? "");

      authToken = userData?.cookie.toString() ?? "";
    });
  }
}
