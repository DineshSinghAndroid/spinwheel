import 'package:flutter/material.dart';
import 'package:spinwheel/Controller/Helper/BuildText/BuildText.dart';

class VideoTutorialsScreen extends StatelessWidget {
  const VideoTutorialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BuildText.buildText(text: "Hello"),
      ),
    );
  }
}
