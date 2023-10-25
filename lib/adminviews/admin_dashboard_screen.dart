import 'package:spinwheel/Controller/Helper/BuildText/BuildText.dart';
import 'package:spinwheel/Controller/ProjectController/adminContollers/adminDashBoardController.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';
import 'package:spinwheel/adminviews/sideDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Utils/Colors/custom_color.dart';
import '../Controller/Utils/CustomFileds/CustomAppBar.dart';

class AdminDashboardScreeen extends StatelessWidget {
  AdminDashboardScreeen({super.key});
  final AdminDashboardController _adminHomeCtrl =
      Get.put(AdminDashboardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _adminHomeCtrl,
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,

          // backgroundColor: Colors.blue.withOpacity(0.1),
          appBar: CustomAppBar(text: "Dashboard Screen"),
          drawer: MyDrawer(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: Get.height,
                width: Get.width,
              ),
            ),
          ),
        );
      },
    );
  }
}
