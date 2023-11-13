import 'package:flutter/material.dart';

import '../../boardUI/main_screen.dart';
import '../reusable/colors_utils.dart';
import '../reusable/empty_reusable_container.dart';
import '../reusable/reusable_container.dart';

class PlayOfflinePlayers extends StatelessWidget {
  bool? isChecked = true;

  PlayOfflinePlayers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            "OFFLINE",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 35),
          ),
          const SizedBox(
            height: 40,
          ),
          ReusableEmptyContainer(
            width: 300,
            height: 120,
            widget: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "SELECT PLAYERS",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),

                      /// code of custom check box
                      Container(
                        margin: const EdgeInsets.all(
                          2.0,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsUtils.darkBlue,
                          border: Border.all(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: isChecked!
                            ? const Padding(
                                padding: EdgeInsets.all(
                                  2.0,
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 20,
                                  color: Colors.yellow,
                                ),
                              )
                            : null,
                      ),
                      const Text(
                        "2P",
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w900,
                            fontSize: 25),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.all(
                          2.0,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsUtils.darkBlue,
                          border: Border.all(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: isChecked!
                            ? const Padding(
                                padding: EdgeInsets.all(
                                  2.0,
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 20,
                                  color: Colors.yellow,
                                ),
                              )
                            : null,
                      ),
                      const Text(
                        "3P",
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.all(
                          2.0,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsUtils.darkBlue,
                          border: Border.all(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: isChecked!
                            ? const Padding(
                                padding: EdgeInsets.all(
                                  2.0,
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 20,
                                  color: Colors.yellow,
                                ),
                              )
                            : null,
                      ),
                      const Text(
                        "4P",
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          ReusableEmptyContainer(
            width: 300,
           height: 250,
            widget: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(
                          2.0,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsUtils.darkBlue,
                          border: Border.all(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: isChecked!
                            ? const Padding(
                          padding: EdgeInsets.all(
                            2.0,
                          ),
                          child: Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.yellow,
                          ),
                        )
                            : null,
                      ),
                      Container(
                        margin: const EdgeInsets.all(
                          2.0,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsUtils.darkBlue,
                          border: Border.all(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: isChecked!
                            ? const Padding(
                          padding: EdgeInsets.all(
                            2.0,
                          ),
                          child: Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.yellow,
                          ),
                        )
                            : null,
                      ),
                    ],
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/ludoOffline/ludo/add.png',
                        height: 50,
                        width: 50,
                      ),
                      Image.asset(
                        "assets/ludoOffline/ludo/add.png",
                        height: 50,
                        width: 50,
                      ),
                      Image.asset(
                        "assets/ludoOffline/ludo/add.png",
                        height: 50,
                        width: 50,
                      ),
                      Image.asset(
                        "assets/ludoOffline/ludo/add.png",
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  const Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Player 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      Text(
                        "Player 2",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      Text(
                        "Player 3",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      Text(
                        "Player 4",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
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
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),))
                    ;
                  },
                  child: const ReusableColoredContainer(
                    width: 80,
                    height: 40,
                    text: "PLAY",
                    font_Size: 18,
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
