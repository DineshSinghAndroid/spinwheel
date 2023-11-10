import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xen_popup_card/xen_popup_card.dart';

import '../../../../CommonScreens/loginAndSignupColumns.dart';
import '../../../../Models/CommonModels/RegisterModel.dart';
import '../../../../CommonScreens/loginAndSignupColumns.dart';
import '../../../ApiController/ApiController.dart';
import '../../../ApiController/WebConstant.dart';
import '../../../RouteController/RouteNames.dart';
import '../../../Utils/Colors/custom_color.dart';
import '../../../Utils/Utils.dart';

class AppOnboardingController extends GetxController {
  ApiController _apiCtrl = ApiController();

  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController userPhoneCtrl = TextEditingController();
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController userpasswordCtrl = TextEditingController();
  TextEditingController userReferCodeCtrl = TextEditingController();

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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    indicatorColor: AppColors.primaryColor,
                    unselectedLabelColor: Colors.grey,
                    labelColor: AppColors.primaryColor,
                    automaticIndicatorColorAdjustment: true,
                    unselectedLabelStyle: const TextStyle(color: Colors.grey),
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    tabs: [
                      Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Register",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w900),
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
    Get.toNamed(apphomeScreen);
    signUpApi(context: context);
  }

  onTapLogin(BuildContext context) {}

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
      "name": userNameCtrl.text.trim().toString(),
      "email": userEmailCtrl.text.trim().toString(),
      "mobile_num": userPhoneCtrl.text.trim().toString(),
      "password": userpasswordCtrl.text.trim().toString(),
      "confirm_password": userReferCodeCtrl.text.trim().toString(),
    };

    String url = WebApiConstant.registerUrl;

    await _apiCtrl
        .registerApiHit(
            context: context, url: url, token: '', dictData: dictparm)
        .then((result) async {
      if (result != null) {
        try {
          if (result.status != null) {
            registerData = result;
            if (result.status != false) {
              Utils.printLog("Status is :::::::;${result.status}");
              ToastCustom.showToast(msg: result.message ?? "asdasfafasfasf");
              Get.toNamed(apphomeScreen);
            }
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
}
