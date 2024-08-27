import 'package:flutter/material.dart';
import '../common.dart';
import '../usagi_scaffold.dart';
import 'p11.dart';

class P10 extends StatelessWidget {
  const P10({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UsagiScaffold(
      content: Ebook(
          imageWidget: SizedBox(
            width: ScreenSize.getStandardWidth(context) * 0.8,
            child: const Row(
              children: [
                ContentImage(imageName: 'assets/p10.png'),
              ],
            ),
          ),
          description: '原來是貓咪先生準備去約會了！但是卻不知該如何打扮。',
          buttonHidden: false,
          buttonTapped: (context) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const P11()));
          }),
    );
  }
}
