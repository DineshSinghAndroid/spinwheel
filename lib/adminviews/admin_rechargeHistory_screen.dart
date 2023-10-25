import 'package:spinwheel/Controller/ProjectController/adminContollers/adminRechargeHistoryController.dart';
import 'package:spinwheel/adminviews/sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Utils/CustomFileds/CustomAppBar.dart';

class AdminRechargeHistoryScreen extends StatelessWidget {
  AdminRechargeHistoryScreen({super.key});
  final AdminRechargeHistoryController _controller =
      Get.put(AdminRechargeHistoryController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _controller,
      builder: (controller) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: CustomAppBar(text: "Recharge History"),
        );
      },
    );
  }
}
