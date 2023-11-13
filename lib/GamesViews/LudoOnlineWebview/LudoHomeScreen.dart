

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';
 import 'package:webview_flutter/webview_flutter.dart';


import 'ludoHomeScreenController.dart';




class LudoHomeScreen extends StatefulWidget {
  const LudoHomeScreen({super.key});

  @override
  State<LudoHomeScreen> createState() => _LudoHomeScreenState();
}

class _LudoHomeScreenState extends State<LudoHomeScreen> {
   final LudoHomeScreenController _ludoCtrl = Get.put(LudoHomeScreenController());

  @override
  void initState() {
     super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Ludo",
        action: [
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: () => _ludoCtrl.webViewCtrl.reload(),
          ),
        ],
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.home))
      ),
      backgroundColor: Colors.green,
      body: GetBuilder(
        init: _ludoCtrl,
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            child: LoadScreen(
                widget: SafeArea(child: WebViewWidget(

                    controller: _ludoCtrl.webViewCtrl)),
                isLoading: _ludoCtrl.isLoading.value),
          );
        },
      ),
    );
  }
}
