import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'color_prediction_controller.dart';

class ColorPredictionHomeScreen extends StatefulWidget {
  const ColorPredictionHomeScreen({super.key});

  @override
  State<ColorPredictionHomeScreen> createState() => _LudoHomeScreenState();
}

class _LudoHomeScreenState extends State<ColorPredictionHomeScreen> {
  final ColorPredictionHomeScreenController _colorCtrl =
      Get.put(ColorPredictionHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Color Prediction",
        action: [
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: () => _colorCtrl.webViewCtrl.reload(),
          ),
        ],
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.home))
      ),
      backgroundColor: Colors.green,
      body: GetBuilder(
        init: _colorCtrl,
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(color: Colors.black),
            child: LoadScreen(
                widget: SafeArea(
                    child: WebViewWidget(controller: _colorCtrl.webViewCtrl)),
                isLoading: _colorCtrl.isLoading.value),
          );
        },
      ),
    );
  }
}
