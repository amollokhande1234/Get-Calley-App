import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle customStyle({
  double size = 16,
  FontWeight weight = FontWeight.normal,
  Color color = Colors.black,
  FontStyle style = FontStyle.normal,
}) {
  return TextStyle(
    fontFamily: "Inter",
    fontSize: size,
    fontWeight: weight,
    color: color,
    fontStyle: style,
  );
}
