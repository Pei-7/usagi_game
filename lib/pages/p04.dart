import 'package:flutter/material.dart';

import '../common.dart';
import '../usagi_scaffold.dart';
import 'p05.dart';

class P4 extends StatelessWidget {
  const P4({
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
                ContentImage(imageName: 'assets/p4.png'),
              ],
            ),
          ),
          description: '發現這居然是一封求救信，兔子先生趕緊騎上自行車出發去找貓咪先生。',
          buttonHidden: false,
          buttonTapped: (context) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const P5()));
          }),
    );
  }
}
