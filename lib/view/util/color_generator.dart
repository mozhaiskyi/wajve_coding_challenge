import 'package:flutter/material.dart';

Color generateColorFromText(String text) {
  var hash = 0;
  for (var i = 0; i < text.length; i++) {
    hash = text.codeUnitAt(i)+ ((hash << 5) - hash);
  }
  final finalHash = hash.abs() % (256 * 256 * 256);
  final red = ((finalHash & 0xFF0000) >> 16);
  final blue = ((finalHash & 0xFF00) >> 8);
  final green = ((finalHash & 0xFF));

  return Color.fromRGBO(red, green, blue, 1);
}

Color generateTextColorBasedOnBackgroundColor(Color backgroundColor) {
  final lightness = HSLColor.fromColor(backgroundColor).lightness;
  return lightness < 0.7 ? Colors.white : Colors.black;
}
