import 'package:flutter/material.dart';
import '../common.dart';
import '../usagi_scaffold.dart';
import 'cover.dart';

class Ending extends StatelessWidget {
  const Ending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UsagiScaffold(
      content: Ebook(
          isTitle: true,
          imageWidget: SizedBox(
            width: ScreenSize.getStandardWidth(context) * 0.8,
            child: Image.asset('assets/p14.png'),
          ),
          description: 'The end',
          buttonText: '回到首頁',
          buttonHidden: false,
          buttonTapped: (context) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Cover()),
              (Route<dynamic> route) => false, // 移除所有之前的路由
            );
          }),
    );
  }
}
