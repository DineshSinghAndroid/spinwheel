import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WalletScreenController extends GetxController{
  bool isLoading = false;
@override
  void onInit() {
  enterDepositAmountValue.text = "100";
    // TODO: implement onInit
    super.onInit();
  }
  List walletNumbers =[
    50,
    100,
    200,
    500,
    1000,
    2000,
    5000,
    10000,

  ];
RxBool  showWidthrawal = false.obs;

TextEditingController enterDepositAmountValue = TextEditingController();
 }