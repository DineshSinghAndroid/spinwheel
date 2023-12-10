import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:spinwheel/CommonScreens/ProfileScreens/profile_screen_controller.dart';
import 'package:spinwheel/Controller/Utils/CustomFileds/CustomAppBar.dart';
import 'package:spinwheel/Controller/Utils/Loader/LoadScreen/LoadScreen.dart';
import 'package:spinwheel/Controller/Utils/StringDefine/StringDefine.dart';

import '../../../Controller/Utils/Colors/custom_color.dart';
import 'ProfileScreen.dart';

class UpdateProfileScreen extends StatelessWidget {
    UpdateProfileScreen({Key? key}) : super(key: key);
  final HomeProfileScreenController _profileCtrl = Get.put(HomeProfileScreenController());

  @override
  Widget build(BuildContext context) {
     return GetBuilder(
       init: _profileCtrl,
       builder: (controller) {
       return Scaffold(
         appBar: CustomAppBar(text: "Edit Profile"),
         body: LoadScreen(widget: Container(
           padding: EdgeInsets.all(8),
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Stack(
                   children: [
                     SizedBox(
                       width: 120,
                       height: 120,
                       child: ClipRRect(
                           borderRadius: BorderRadius.circular(100),
                           child: Image.network(
                             _profileCtrl.profileData?.data?.profileImage?.toString()??"",
                             fit: BoxFit.cover,
                             loadingBuilder: (BuildContext context, Widget child,
                                 ImageChunkEvent? loadingProgress) {
                               if (loadingProgress == null) return child;
                               return Center(
                                 child: CircularProgressIndicator(
                                   value: loadingProgress.expectedTotalBytes != null
                                       ? loadingProgress.cumulativeBytesLoaded /
                                       loadingProgress.expectedTotalBytes!
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
             
                 const SizedBox(height: 50),
             
                 // -- Form Fields
                 Form(
                   child: Column(
                     children: [
                       TextFormField(
                         initialValue: _profileCtrl.profileData?.data?.displayname??"",
                         decoration:   InputDecoration(
                               label: Text("Full Name"),
                               prefixIcon: Icon(LineAwesomeIcons.user)),
                       ),
                       const SizedBox(height: 40 - 20),
                       TextFormField(
                         initialValue: _profileCtrl.profileData?.data?.email??"",

                         decoration: const InputDecoration(
                             label: Text("Email"),
                             prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                       ),
                       const SizedBox(height: 40 - 20),
                       TextFormField(
                         initialValue: _profileCtrl.profileData?.data?.username??"",

                         decoration: const InputDecoration(
                             label: Text(kMobileNumber),
                             prefixIcon: Icon(LineAwesomeIcons.phone)),
                       ),
                       const SizedBox(height: 40 - 20),
                       TextFormField(
                         obscureText: true,
                         decoration: InputDecoration(
                           hintText: "**********",

                           label: const Text(kPassword),
                           prefixIcon: const Icon(Icons.fingerprint),
                           suffixIcon: IconButton(
                               icon: const Icon(LineAwesomeIcons.eye_slash),
                               onPressed: () {}),
                         ),
                       ),
                       const SizedBox(height: 40),
             
                       // -- Form Submit Button
                       SizedBox(
                         width: double.infinity,
                         child: ElevatedButton(
                           onPressed: () => Get.to(() =>   ProfileScreen()),
                           style: ElevatedButton.styleFrom(
                               backgroundColor: AppColors.blueColorApp,
                               side: BorderSide.none,
                               shape: const StadiumBorder()),
                           child: Text("Edit Profile",
                               style: TextStyle(color: AppColors.whiteColor)),
                         ),
                       ),
                       const SizedBox(height: 40),
             
                       // -- Created Date and Delete Button
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           const Text.rich(
                             TextSpan(
                               text: "Joined",
                               style: TextStyle(fontSize: 12),
                               children: [
                                 TextSpan(
                                     text: " 12 june 2023",
                                     style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         fontSize: 12))
                               ],
                             ),
                           ),
                           ElevatedButton(
                             onPressed: () {},
                             style: ElevatedButton.styleFrom(
                                 backgroundColor:
                                 Colors.redAccent.withOpacity(0.1),
                                 elevation: 0,
                                 foregroundColor: Colors.red,
                                 shape: const StadiumBorder(),
                                 side: BorderSide.none),
                             child: const Text("Delete Account"),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ), isLoading: _profileCtrl.isLoading),
       );
     },);
  }
}
