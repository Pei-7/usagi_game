import 'package:flutter/material.dart';

Color themeColorLight = const Color.fromARGB(255, 248, 227, 194);
Color themeColorDark = const Color.fromARGB(255, 144, 105, 61);

class ScreenSize {
  final double standardLength;

  const ScreenSize({required this.standardLength});

  static double getStandardWidth(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double length = size.width;
    if (size.width > size.height) {
      length = (size.height) / 852 * 393 / 0.8;
    }
    return length;
  }
}

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.only(bottom: 4, top: 8, left: 24, right: 24),
      content: Text(text, style: const TextStyle(fontSize: 14)),
      backgroundColor: themeColorDark,
    ),
  );
}

void hideSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).clearSnackBars();
}
