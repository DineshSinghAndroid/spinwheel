import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../Helper/BuildText/BuildText.dart';
import '../RouteController/RouteNames.dart';

class Utils {
  static void printLog(var log) {
    print(log);
  }
}

class ToastCustom {
  static showToast({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      gravity: ToastGravity.TOP,

    );
  }

  static showToastWithLength({required String msg, Toast? toastLength}) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.TOP,
        toastLength: toastLength ?? Toast.LENGTH_LONG,
        textColor: Colors.white);
  }

  static showToastWithGravity({required String msg, ToastGravity? gravity}) {
    Fluttertoast.showToast(msg: msg, gravity: gravity ?? ToastGravity.TOP);
  }

}
InkWell ShowBalanceBoxCommon(
{  required String balance,
}
    ) {
  return InkWell(
    onTap: ()=>Get.toNamed(walletScreen),
    child: Container(  decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(8),)
        ,border: Border.all(color: Colors.black
        ,width: 1)

    ),
      padding: EdgeInsets.symmetric(horizontal: 4,vertical: 0),
      margin: EdgeInsets.only(top: 10,right: 10,bottom: 10),
      child: Row(
        children: [
          Lottie.asset("assets/ludoOffline/walletLottie.json",
              // height: 50,
              width: 50
          ),
          BuildText.buildText(text: balance??"",size: 18,weight: FontWeight.w800),
buildSizeBox(0.0, 5.0),
          Lottie.asset("assets/ludoOffline/addLottie.json",// height: 50,
          ),

        ],
      ),
    ),
  );
}
