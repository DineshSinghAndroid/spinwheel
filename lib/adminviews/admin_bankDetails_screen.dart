import 'package:spinwheel/Controller/ProjectController/adminContollers/adminBankDeatailsController.dart';
import 'package:spinwheel/adminviews/sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Utils/CustomFileds/CustomAppBar.dart';

class AdminBankDetailsScreen extends StatelessWidget {
  AdminBankDetailsScreen({super.key});
  final AdminBankDetailsSetupController _adminBankDeatilsCtrl =
      Get.put(AdminBankDetailsSetupController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _adminBankDeatilsCtrl,
      builder: (controller) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: CustomAppBar(text: "Bank Details Screen"),
        );
      },
    );
  }
}
