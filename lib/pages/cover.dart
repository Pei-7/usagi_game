import 'package:flutter/material.dart';
import '../common.dart';
import '../usagi_scaffold.dart';
import 'p01.dart';

class Cover extends StatelessWidget {
  const Cover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UsagiScaffold(
      isCover: true,
      content: Ebook(
          isTitle: true,
          imageWidget: SizedBox(
            width: ScreenSize.getStandardWidth(context) * 0.8,
            child: Image.asset('assets/p0.png'),
          ),
          description: '神秘的來信',
          buttonText: '開始遊戲',
          buttonHidden: false,
          buttonTapped: (context) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const P1()));
          }),
    );
  }
}
