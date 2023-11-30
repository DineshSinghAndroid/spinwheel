// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
//
// import '../reusable/empty_reusable_container.dart';
// import '../reusable/reusable_container.dart';
//
// class TablePlay extends StatelessWidget {
//   const TablePlay({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           ReusableEmptyContainer(
//             widget: GridView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: 10,
//               shrinkWrap: true,
//               physics: const ScrollPhysics(),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 20,
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   height: 90,
//                   width: 90,
//                   decoration: BoxDecoration(
//                     color: Colors.yellow,
//                     borderRadius: BorderRadius.circular(
//                       10,
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(8),
//                   child: FittedBox(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                           decoration: const BoxDecoration(
//                             color: Colors.green,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(8),
//                               topRight: Radius.circular(8),
//                             ),
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Image.asset(
//                                     'assets/ludoOffline/ludo/coin.png',
//                                     // Replace with your image path
//                                     height: 15,
//                                     width: 15,
//                                   ),
//                                   const Text(
//                                     'WIN',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5),
//                               Container(
//                                 //  height: 8,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFF204B22),
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: const Text(
//                                   '50',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Text(
//                           '95',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // const SizedBox(
//           //   height: 50,
//           // ),
//         ],
//       ),
//     );
//   }
// }
