import 'package:flutter/material.dart';

import '../reusable/colors_utils.dart';
import '../reusable/empty_reusable_container.dart';
import '../reusable/reusable_container.dart';
class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "LEADERBOARD",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorsUtils.mediumBlue,
              border: Border.all(color: Colors.amber, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            // padding: EdgeInsets.all(10),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                const SizedBox(height: 10),
                Center(child: Image.asset("assets/ludoOffline/ludo/walletnew.png", height: 50,width: 50,)),
                const Center(
                  child: Text(
                    'TOTAL BALANCE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ), const Center(
                  child: Text(
                    '10',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Text(
                  'Store Money',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  // width: 200,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amber, width: 2),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amber, width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amber, width: 2),
                      ),
                      filled: true,
                      fillColor: ColorsUtils.mediumBlue,
                      prefixIcon: Image.asset("assets/ludoOffline/ludo/coin.png", height: 15,width: 15,)
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amber, width: 2),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amber, width: 2),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.amber, width: 2),
                      ),
                      filled: true,
                      fillColor: ColorsUtils.mediumBlue,
                      prefixIcon: Image.asset("assets/ludoOffline/ludo/coin.png", height: 15,width: 15,)
                    ),
                  ),
                ),
                  Center(
                  child: ReusableColoredContainer(
                    height: 40,
                    width: 100,
                    text: "Add money",
                    font_Size: 15,
                  ),
                ),
                  Center(
                  child: ReusableColoredContainer(
                    height: 40,
                    width: 180,
                    text: "Transfer to Account",
                    font_Size: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: ReusableEmptyContainer(
                height: 30,
                width: 50,
                widget: Image.asset(
                  "assets/ludoOffline/ludo/backicon.png",
                  height: 25,
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
