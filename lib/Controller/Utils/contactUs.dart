import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Contactus {
  static FloatingActionButton contactUsFloatingButton() {
    return FloatingActionButton(onPressed: (){

    },

        child:Lottie.asset('assets/ludoOffline/supportLottie.json'));
  }

}