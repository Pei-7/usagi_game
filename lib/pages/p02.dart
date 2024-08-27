import 'package:flutter/material.dart';

import '../common.dart';
import '../usagi_scaffold.dart';
import 'p03.dart';

class P2 extends StatelessWidget {
  const P2({
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
              ContentImage(imageName: 'assets/p2.png'),
            ],
          ),
        ),
        description: '一打開，發現居然是好朋友貓咪先生寄來的密信！',
        buttonHidden: false,
        buttonTapped: (context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const P3(),
              ));
        },
      ),
    );
  }
}
