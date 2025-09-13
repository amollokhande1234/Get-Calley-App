import 'package:flutter/material.dart';

Widget languageWidget(String title, String subTitle, {bool? checked}) {
  return Container(
    margin: EdgeInsets.only(top: 15, bottom: 12, left: 30, right: 30),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text(title, style: TextStyle(fontSize: 16)),

            // subtitle
            Text(
              subTitle,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
            ),
          ],
        ),
        // checkbox
        Icon(
          checked == true
              ? Icons.radio_button_checked
              : Icons.radio_button_off_outlined,
        ),
      ],
    ),
  );
}
