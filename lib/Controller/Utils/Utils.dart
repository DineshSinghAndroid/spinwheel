import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void printLog(var log) {
    print(log);
  }
}

class ToastCustom {
  static showToast({required String msg}) {
    Fluttertoast.showToast(msg: msg, textColor: Colors.white);
  }

  static showToastWithLength({required String msg, Toast? toastLength}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength ?? Toast.LENGTH_LONG,
        textColor: Colors.white);
  }

  static showToastWithGravity({required String msg, ToastGravity? gravity}) {
    Fluttertoast.showToast(msg: msg, gravity: gravity ?? ToastGravity.TOP);
  }
}
