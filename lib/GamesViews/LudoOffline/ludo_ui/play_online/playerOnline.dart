import 'package:flutter/material.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/play_online/select_playertype_online.dart';

import '../reusable/empty_reusable_container.dart';
import '../reusable/reusable_container.dart';

class PlayOnline extends StatelessWidget {
  const PlayOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 150,),
          const Text(
            "ONLINE",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 35),
          ),
          const SizedBox(height: 60,),
            ReusableEmptyContainer(
            width: 300,
            widget: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SELECT MODE",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                  ),
                  ReusableColoredContainer(
                    height: 50,
                    width: 180,
                    text: "TABLE PLAY",
                    font_Size: 16,
                  ),
                  ReusableColoredContainer(
                    height: 50,
                    width: 180,
                    font_Size: 16,
                    text: "TIMER PLAY",
                  ),
                  ReusableColoredContainer(
                    height: 50,
                    width: 180,
                    font_Size: 16,
                    text: "PLAY WITH FRIENDS",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
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
                   Navigator.of(context).pop();
                    showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,backgroundColor: Colors.black38,
                        builder: (BuildContext context) {
                          return  const SelectPlayerOnline();
                        });
                  },
                  child: const ReusableColoredContainer(
                    width: 80,
                    height: 40,
                    text: "NEXT",
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
    );
  }
}
