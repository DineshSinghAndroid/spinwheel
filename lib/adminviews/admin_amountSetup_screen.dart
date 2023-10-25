import 'package:spinwheel/Controller/ProjectController/adminContollers/adminAmountSetupController.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
import 'package:spinwheel/adminviews/sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminAmountSetupScreen extends StatelessWidget {
  AdminAmountSetupScreen({super.key});
  final AdminAmountSetupController _adminHomeCtrl =
      Get.put(AdminAmountSetupController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _adminHomeCtrl,
      builder: (controller) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: CustomAppBar(text: "Amount Setup"),
        );
      },
    );
  }
}
