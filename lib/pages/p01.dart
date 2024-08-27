import 'package:flutter/material.dart';
import '../common.dart';
import '../usagi_scaffold.dart';
import 'p02.dart';

class P1 extends StatelessWidget {
  const P1({
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
                ContentImage(imageName: 'assets/p1_1.png'),
                ContentImage(imageName: 'assets/p1_2.png'),
              ],
            ),
          ),
          description: '有一天，兔子先生收到了青蛙郵差送的信。',
          buttonHidden: false,
          buttonTapped: (context) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const P2()));
          }),
    );
  }
}
