import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:spinwheel/CommonScreens/WalletScreen/wallet_controllre.dart';
import 'package:spinwheel/Controller/Helper/BuildText/BuildText.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/ButtonCustom.dart';
 import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
 import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';

class WalletScreen extends StatelessWidget {
    WalletScreen({super.key});

   final WalletScreenController _walletCtrl = Get.put(WalletScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Wallet"),
      backgroundColor: Colors.grey[300],
      body:GetBuilder(
        init: _walletCtrl,
        builder: (controller) {
        return  LoadScreen(widget: SafeArea(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
               children: [
                buildSizeBox(20.0, 0.0),
                 Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '\$' + "122",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                buildSizeBox(30.0, 0.0),

                //button -> send, pay, bill
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        _walletCtrl.showWidthrawal.value = false;
                        _walletCtrl.update();
                        print(_walletCtrl.showWidthrawal.value);

                      },
                      child: Container(
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/ludoOffline/wallet/sendmoney.png')),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        _walletCtrl.showWidthrawal.value = true;
                        _walletCtrl.update();

                        print(_walletCtrl.showWidthrawal.value);

                      },
                      child: Container(
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/ludoOffline/wallet/card.png'))),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildText.buildText(text: "Add Wallet", weight: FontWeight.w700),
                    BuildText.buildText(text: "Withdrawal", weight: FontWeight.w700),
                  ],
                ),
                buildSizeBox(30.0, 0.0),
                Obx(() =>  Visibility(
                   visible: _walletCtrl.showWidthrawal.value,
                   child: Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         border: Border.all(
                           color: Colors.grey,
                           width: 2,
                         )),
                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                     child: Column(
                       children: [
                         TextFormField(
                           textInputAction: TextInputAction.next,
                           keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                               hintText: "0",
                               border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               labelText: "Enter Amount"),
                         ),
                         buildSizeBox(10.0, 0.0),
                         TextFormField(
                           textInputAction: TextInputAction.next,
                           keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                               hintText: "abcd@ybl",
                               border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               labelText: "Enter Upi ID"),
                         ),
                         buildSizeBox(10.0, 0.0),
                         TextFormField(
                           textInputAction: TextInputAction.next,
                           keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                               hintText: "0",
                               border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                               labelText: "Enter Amount"),
                         ),
                         buildSizeBox(10.0, 0.0),
                       ],
                     ),
                   )),),
                Obx(() => Visibility(
                    visible: !_walletCtrl.showWidthrawal.value,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          )),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(
                        children: [
                          BuildText.buildText(text: "Deposit",weight: FontWeight.w800,size: 18),
                          buildSizeBox(10.0, 0.0),
                          TextFormField(
                            controller: _walletCtrl.enterDepositAmountValue,
                            style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: "0",
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                labelText: "Enter Amount"),
                          ),
                          buildSizeBox(10.0, 0.0),
                          SizedBox(width: Get.width,child:
                          GridView.builder(

                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _walletCtrl.walletNumbers.length??0,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5  ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  _walletCtrl.enterDepositAmountValue.text =
                                      _walletCtrl.walletNumbers[index].toString();
                                  _walletCtrl.update();
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),child: Center(child: BuildText.buildText(text: _walletCtrl.walletNumbers[index].toString(),size: 14,weight: FontWeight.w800)),),
                              )
                              ;
                            },),),
                          buildSizeBox(20.0, 0.0),
                          Center(
                            child: NeoPopTiltedButton(
                              isFloating: true,
                              onTapUp: () {},
                              // onTapDown: () => _onBdCtrl.onTapLogin(context),
                              decoration: const NeoPopTiltedButtonDecoration(
                                color: Colors.blue,
                                plunkColor: Color.fromRGBO(255, 235, 52, 1),
                                shadowColor: Color.fromRGBO(36, 36, 36, 1),
                                showShimmer: true,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50.0,
                                  vertical: 15,
                                ),
                                child: BuildText.buildText(
                                    text: "Add Money",
                                    size: 14,
                                    color: Colors.black,
                                    weight: FontWeight.w800),
                              ),
                            ),
                          ),

                        ],
                      ),
                    )),)
              ],
            ),
          ),
        ), isLoading: _walletCtrl.isLoading);
      },),
    );
  }
}

