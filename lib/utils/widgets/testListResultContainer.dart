import 'package:flutter/material.dart';
import 'package:getcalleyapp/consts/font.dart';

Widget testListContainer({
  String? result,
  String? number,
  Color? boxColor,
  double? width,
  Color? stickColor,
}) {
  return Container(
    width: 95,
    height: 80,
    margin: EdgeInsets.only(left: 5, right: 5),
    padding: const EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
      color: boxColor ?? Colors.amber.shade100,

      borderRadius: BorderRadius.circular(25),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),

      child: Center(
        child: Row(
          children: [
            Container(
              width: 4,
              height: 50,
              decoration: BoxDecoration(
                color: stickColor ?? Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(width: 5),
            Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    textAlign: TextAlign.center,
                    result ?? 'Pending',
                    style: customStyle(
                      size: 12,
                      color: Colors.black,
                      weight: FontWeight.w600,
                    ),
                  ),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: number ?? '50',
                          style: customStyle(
                            size: 20,
                            color: Colors.black,
                            weight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: " CALLS",
                          style: customStyle(
                            size: 10,
                            color: Colors.black,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
