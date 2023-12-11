import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:spinwheel/CommonScreens/ProfileScreens/profile_screen_controller.dart';
import 'package:spinwheel/Controller/Helper/BuildText/BuildText.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';
import 'package:spinwheel/Controller/Utils/Utils.dart';

import '../../../Controller/Utils/Colors/custom_color.dart';
import 'ProfileMenuWidget.dart';
import 'UpdateProfileScreen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final HomeProfileScreenController _profileCtrl =
      Get.put(HomeProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _profileCtrl,
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            text: "Profile",
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  /// -- IMAGE
                  Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  _profileCtrl.profileData?.data?.profileImage
                                          ?.toString() ??
                                      "",
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                )),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.blueDeliveryNoteColor),
                              child: const Icon(
                                LineAwesomeIcons.alternate_pencil,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      BuildText.buildText(
                          text:
                              _profileCtrl.profileData?.data?.displayname ?? "",
                          color: Colors.green)
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 1, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_profileCtrl.profileData?.data?.username
                                .toString() !=
                            "")
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BuildText.buildText(
                                  text: "Phone Number:",
                                  color: AppColors.blackColor,
                                  size: 12),
                              BuildText.buildText(
                                  text: _profileCtrl
                                          .profileData?.data?.username ??
                                      "",
                                  color: AppColors.blueDeliveryNoteColor),
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildText.buildText(
                                text: "Email:",
                                color: AppColors.blackColor,
                                size: 12),
                            BuildText.buildText(
                                text:
                                    _profileCtrl.profileData?.data?.email ?? "",
                                color: AppColors.blueDeliveryNoteColor),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BuildText.buildText(
                                text: "KYC:",
                                color: AppColors.blackColor,
                                size: 12),
                            InkWell(
                                onTap: () {
                                  ToastCustom.showToast(
                                      msg: "KYC Will available soon");
                                },
                                child: BuildText.buildText(
                                    text: "  Click To verify",
                                    color: AppColors.redColor)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// -- BUTTON
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => UpdateProfileScreen()),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blueColorApp,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: BuildText.buildText(
                        text: "Edit Profile",
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),

                  /// -- MENU
                  ProfileMenuWidget(
                      title: "Settings",
                      icon: LineAwesomeIcons.cog,
                      onPress: () {}),
                  ProfileMenuWidget(
                      title: "Wallet",
                      icon: LineAwesomeIcons.wallet,
                      onPress: () {}),
                  ProfileMenuWidget(
                      title: "Transaction History",
                      icon: LineAwesomeIcons.wallet,
                      onPress: () {}),
                  ProfileMenuWidget(
                      title: "Transaction History",
                      icon: LineAwesomeIcons.wallet,
                      onPress: () {}),
                  const Divider(),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                      title: "How to Use",
                      icon: LineAwesomeIcons.user_check,
                      onPress: () {}),
                  ProfileMenuWidget(
                      title: "Terms & Conditions",
                      icon: LineAwesomeIcons.info,
                      onPress: () {}),
                  ProfileMenuWidget(
                      title: "Contact Support",
                      icon: LineAwesomeIcons.info,
                      onPress: () {}),
                  ProfileMenuWidget(
                      title: "Logout",
                      icon: LineAwesomeIcons.alternate_sign_out,
                      textColor: Colors.red,
                      endIcon: false,
                      onPress: () {
                        Get.defaultDialog(
                          title: "LOGOUT",
                          titleStyle: const TextStyle(fontSize: 20),
                          content: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: BuildText.buildText(
                                text: "Are you sure, you want to Logout?"),
                          ),
                          confirm: Expanded(
                            child: ElevatedButton(
                              // onPressed: () => AuthenticationRepository.instance.logout(),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  side: BorderSide.none),
                              onPressed: () {},
                              child: BuildText.buildText(text: "Yes"),
                            ),
                          ),
                          cancel: OutlinedButton(
                              onPressed: () => Get.back(),
                              child: BuildText.buildText(text: "No")),
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
