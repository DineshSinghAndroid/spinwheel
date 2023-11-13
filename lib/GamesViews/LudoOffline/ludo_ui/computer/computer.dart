import 'package:flutter/material.dart';


import '../reusable/empty_reusable_container.dart';
import '../reusable/reusable_container.dart';

class Computer extends StatelessWidget {
  const Computer({super.key});

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
                    //  height: 50,
                    //  width: 200,
                    widget: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const Text(
                            "SELECT YOUR COLOR",
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  const ReusableEmptyContainer(
                    //  height: 50,
                    //  width: 200,
                    widget: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "SELECT PLAYERS",
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "2 PLAYERS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "4 PLAYERS",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
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
                      //       return TablePlay();
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
