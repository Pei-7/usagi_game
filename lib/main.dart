import 'package:flutter/material.dart';
import 'common.dart';
import 'pages/cover.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print(ScreenSize.getStandardWidth(context));
    return MaterialApp(
      color: themeColorLight,
      home: const Cover(),
    );
  }
}
