import 'package:flutter/material.dart';

import '../common.dart';
import '../usagi_scaffold.dart';
import 'p07.dart';

class P6 extends StatelessWidget {
  const P6({
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
                ContentImage(imageName: 'assets/p6.png'),
              ],
            ),
          ),
          description: '兔子先生成功穿過了牆！兔子先生趕緊加速前往貓咪先生的家。',
          buttonHidden: false,
          buttonTapped: (context) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const P7()));
          }),
    );
  }
}
