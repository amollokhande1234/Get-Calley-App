import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/font.dart';

Widget customDrawerItem(String iconPath, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Row(
        children: [
          Container(
            height: 40,
            width: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Image.asset(iconPath)),
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: customStyle(
              size: 18,
              color: Colors.black,
              weight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
