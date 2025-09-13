// import 'package:flutter/material.dart';
// import 'package:getcalleyapp/consts/font.dart';

// Widget profileContainer(BuildContext context) {
//   return Container(
//     // width: MediaQuery.of(context).size.width,
//     width: double.infinity,

//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20),
//       color: Colors.blue,
//     ),
//     height: 95,
//     child: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Row(
//         children: [
//           // Icon
//           ClipRRect(child: Image.asset('assets/logos/profile.png')),

//           SizedBox(width: 15),
//           // Column  Greating Name
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 2.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,

//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hello Swati",
//                   style: customStyle(
//                     size: 16,
//                     color: Colors.white,
//                     weight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   "Calley Personal",
//                   style: customStyle(
//                     size: 18,
//                     color: Colors.white,
//                     weight: FontWeight.w800,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/font.dart';

Widget profileContainer(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 95, // fixed height
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.blue,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          // Icon
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/logos/profile.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          // Column Greeting Name
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // center vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Swati",
                style: customStyle(
                  size: 16,
                  color: Colors.white,
                  weight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5), // spacing between texts
              Text(
                "Calley Personal",
                style: customStyle(
                  size: 18,
                  color: Colors.white,
                  weight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
