import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/font.dart';

Widget loadNumberCallHomePage() {
  return Container(
    // width: ,
    height: 337,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromARGB(255, 3, 44, 78),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            textAlign: TextAlign.center,
            'Load Number to Call',
            style: customStyle(
              size: 15,
              color: Colors.white,
              weight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: double.infinity, // ensures full width
            height: double.infinity, // ensures full height\
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Visit https://app.getcalley.com to upload numbers that you wish to call using Calley Mobile App.',
                    style: customStyle(
                      size: 15,
                      color: Colors.black,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 260,
                    height: 225.77215576171875,
                    child: Image.asset('assets/logos/profile_setting.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
