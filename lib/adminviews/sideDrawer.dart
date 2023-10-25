import 'package:spinwheel/Controller/Helper/BuildText/BuildText.dart';
import 'package:spinwheel/Controller/ProjectController/adminContollers/adminDashBoardController.dart';
import 'package:spinwheel/Controller/ProjectController/adminContollers/adminSideDrawerController.dart';
import 'package:spinwheel/Controller/Utils/Colors/custom_color.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  final AdminDrawerController _adminDrawerCtrl =
      Get.put(AdminDrawerController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.4),
            ),
            child: Image.asset(
              kLogo,
            ),
          ),
          ListTile(
            leading: const Icon(
              color: Colors.white,
              Icons.home,
            ),
            title: BuildText.buildText(text: 'Dashboard'),
            onTap: () {
              Navigator.pop(context);
              _adminDrawerCtrl.onTapDashboard();
            },
          ),
          ListTile(
            leading: const Icon(color: Colors.white, Icons.person),
            title: BuildText.buildText(text: 'Users Management'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer

              _adminDrawerCtrl.onTapUserManagement();
            },
          ),

          ListTile(
            leading: const Icon(color: Colors.white, Icons.money),
            title: BuildText.buildText(text: 'Recharge History'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer

              _adminDrawerCtrl.onTapRechargeHistory();

              // Handle drawer item tap
              // You can navigate to a different screen or perform an action here
            },
          ),
          ListTile(
            leading: const Icon(color: Colors.white, Icons.currency_bitcoin),
            title: BuildText.buildText(text: 'Withdrawal history'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              _adminDrawerCtrl.onTapUserWidthrawalHistory();
            },
          ),
          ListTile(
            leading: const Icon(color: Colors.white, Icons.amp_stories),
            title: BuildText.buildText(text: 'Amount Setup'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer

              _adminDrawerCtrl.onTapAmountSetup();
            },
          ),
          ListTile(
            leading: const Icon(color: Colors.white, Icons.food_bank_outlined),
            title: BuildText.buildText(text: 'Bank Details'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer

              _adminDrawerCtrl.onTapBankDetails();
            },
          ),
          ListTile(
            leading: const Icon(color: Colors.white, Icons.logout),
            title: BuildText.buildText(text: 'Logout'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer

              _adminDrawerCtrl.onTapLogout();
            },
          ),
          // Add more list items as needed
        ],
      ),
    );
  }
}
