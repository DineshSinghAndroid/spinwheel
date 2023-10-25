// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:xen_popup_card/xen_card.dart';
//
// import 'Colors/custom_color.dart';
//
// Widget cardWithBodyOnly({required BuildContext context}) => XenPopupCard(
//   body: DefaultTabController(
//     length: 2,
//     child:Scaffold(
//       body: Container(
//         height: 500,width: Get.width,
//         child: Column(
//           children: [
//             TabBar(
//                 isScrollable: true,
//                 indicatorPadding: EdgeInsets.only(top: 20),
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 indicatorColor: AppColors.primaryColor,
//                 unselectedLabelColor: Colors.grey,
//                 labelColor: AppColors.primaryColor,
//                 automaticIndicatorColorAdjustment: true,
//                 unselectedLabelStyle: TextStyle(color: Colors.grey),
//                 labelPadding:
//                 EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                 tabs: [
//                   Text(
//                     "Popular",
//                     style: GoogleFonts.poppins(
//                         fontSize: 12, fontWeight: FontWeight.w600),
//                   ),
//                   Text(
//                     "Validity",
//                     style: GoogleFonts.poppins(
//                         fontSize: 12, fontWeight: FontWeight.w600),
//                   ),
//             ]),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                  Text("asdfasfa"),
//                  Text("asdfasdf"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ) ,
//   )
// );