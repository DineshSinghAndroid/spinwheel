import 'package:spinwheel/Controller/ProjectController/adminContollers/adminWidthRawalHistoryController.dart';
import 'package:spinwheel/adminviews/sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Utils/CustomFileds/CustomAppBar.dart';

class AdminWidthdrawalHistoryScreen extends StatelessWidget {
  AdminWidthdrawalHistoryScreen({super.key});
  final AdminWidthRawalController _controller =
      Get.put(AdminWidthRawalController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _controller,
      builder: (controller) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: CustomAppBar(text: "Withdrawal History"),
        );
      },
    );
  }
}
