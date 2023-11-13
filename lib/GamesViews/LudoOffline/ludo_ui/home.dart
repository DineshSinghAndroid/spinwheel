import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/reusable/background-widget.dart';
import 'package:spinwheel/GamesViews/LudoOffline/ludo_ui/select_game_type.dart';


class LudoOfflineGameScreen extends StatefulWidget {
  const LudoOfflineGameScreen({Key? key}) : super(key: key);

  @override
  State<LudoOfflineGameScreen> createState() => _HomeState();
}

class _HomeState extends State<LudoOfflineGameScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
            ()=>Navigator.push(context,
            MaterialPageRoute(builder:
                (context) =>
                const SelectGameType()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return const BackgroundImageWidget();
  }
}