import 'package:flutter/material.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/play_offline/PlayOffline.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/play_online/playerOnline.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/play_online/table_play.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/reusable/StringUtils.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/reusable/background-widget.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/reusable/colors_utils.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/reusable/custom_progress.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/store/store.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/wallet/wallet.dart';

import 'computer/computer.dart';
import 'leaderboard/leaderboard.dart';

class SelectGameType extends StatelessWidget {
  const SelectGameType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BackgroundImageWidget(
            isLogo: false,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      5.0,
                                    ),
                                  ),
                                  child: Image.asset("assets/ludoOffline/ludo/prof.png"),
                                ),
                                const Text(
                                  "Guest123",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: CustomProgressBar(
                              progress: 0.6,
                              width: 60,
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 70,
                            height: 20,
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(bottom: 20, right: 10),
                            decoration: const BoxDecoration(
                              color: Colors.black87, // Background color
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/ludoOffline/ludo/coin.png",
                                  height: 30,
                                ),
                                const Text(
                                  "3250",
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset(
                                    "assets/ludoOffline/ludo/add.png",
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:4.0),
                      child: Divider(
                        thickness: 5.0,
                        color: Colors.yellow,
                        height: 0.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            "assets/ludoOffline/ludo/Exit.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            "assets/ludoOffline/ludo/Social.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            "assets/ludoOffline/ludo/Support.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/ludoOffline/ludo/Ludologo.png",
                      height: 150,
                      width: 150,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            "assets/ludoOffline/ludo/Settings.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            "assets/ludoOffline/ludo/Notice.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset(
                            "assets/ludoOffline/ludo/Group 27.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  //  height: 250,
                //  margin: const EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder:
                                //         (context) =>
                                //      const PlayOffline()
                                //     )
                                // );
                                showModalBottomSheet<void>(
                                    context: context,
                                    isScrollControlled: true,backgroundColor: Colors.black38,
                                    builder: (BuildContext context) {
                                      return const PlayOffline();
                                });
                              },
                              child: Image.asset(
                                "assets/ludoOffline/ludo/Offline.png",
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                                showModalBottomSheet<void>(
                                    context: context,
                                    isScrollControlled: true,backgroundColor: Colors.black38,
                                    builder: (BuildContext context) {
                                      return  const PlayOnline();
                                    });
                              },
                              child: Image.asset(
                                "assets/ludoOffline/ludo/Online.png",
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,backgroundColor: Colors.black38,
                                  builder: (BuildContext context) {
                                    return const Computer();
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ludoOffline/ludo/Computer.png",
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.black38,
                                  builder: (BuildContext context) {
                                    return const TablePlay();
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/ludoOffline/ludo/Tournament.png",
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 200,
                  padding: const EdgeInsets.all(8.0),
                //  margin: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 2),
                    color: ColorsUtils.darkBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.share,color: Colors.yellow,),
                      Text(
                        StringUtils.invite,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.black38,
                              builder: (BuildContext context) {
                                return const Wallet();
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:10.0),
                          child: Image.asset(
                            "assets/ludoOffline/ludo/Wallet.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ), InkWell(
                        onTap: (){
                          showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.black38,
                              builder: (BuildContext context) {
                                return const LeaderBoard();
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top:40.0),
                          child: Image.asset(
                            "assets/ludoOffline/ludo/Leaderboard.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ), InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                          showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.black38,
                              builder: (BuildContext context) {
                                return const Store();
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:10.0),
                          child: Image.asset(
                            "assets/ludoOffline/ludo/Store.png",
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
