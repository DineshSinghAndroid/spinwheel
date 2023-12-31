import 'package:spinwheel/Controller/ProjectController/adminContollers/adminUserManagementController.dart';
import 'package:spinwheel/adminviews/sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Utils/CustomFileds/CustomAppBar.dart';

class AdminUserManagementScreen extends StatelessWidget {
  AdminUserManagementScreen({super.key});
  final AdminUserManagementController _controller =
      Get.put(AdminUserManagementController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _controller,
      builder: (controller) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: CustomAppBar(text: "User Management"),
        );
      },
    );
  }
}
