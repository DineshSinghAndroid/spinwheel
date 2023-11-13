import 'package:flutter/material.dart';

import '../reusable/empty_reusable_container.dart';
import '../reusable/reusable_container.dart';


class TablePlay extends StatelessWidget {
  const TablePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReusableEmptyContainer(
                    widget: Column(
                      children: [
                        ReusableEmptyContainer(
                          //  height: 50,
                          //  width: 200,
                          widget: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                const Text(
                                  "TABLE PLAY",
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      "assets/ludoOffline/ludo/bluepoint.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    Image.asset(
                                      "assets/ludoOffline/ludo/redpoint.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    Image.asset(
                                      "assets/ludoOffline/ludo/greenpoint.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    Image.asset(
                                      "assets/ludoOffline/ludo/yellowpoint.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        ReusableEmptyContainer(
                          widget: SingleChildScrollView(
                            child: SizedBox(
                              height: 300,
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 10,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                      mainAxisSpacing: 25,
                                      crossAxisSpacing: 20,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(10,),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: FittedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 40,
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      'assets/ludoOffline/ludo/coin.png',
                                                      // Replace with your image path
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                    const Text(
                                                      'WIN',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Container(
                                                  //  height: 8,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF204B22),
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                  ),
                                                  child: const Text(
                                                    '1,000',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Text(
                                            '1000',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
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
                    onTap: () {
                      Navigator.of(context).pop();
                      // showModalBottomSheet<void>(
                      //     context: context,
                      //     isScrollControlled: true,
                      //     backgroundColor: Colors.black38,
                      //     builder: (BuildContext context) {
                      //       return const Settings();
                      //     });
                    },
                    child: const ReusableColoredContainer(
                      width: 80,
                      height: 40,
                      text: "PLAY",
                      font_Size: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
