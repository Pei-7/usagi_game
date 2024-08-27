import 'package:flutter/material.dart';

import '../common.dart';
import '../usagi_scaffold.dart';
import 'p08.dart';

class P7 extends StatelessWidget {
  const P7({
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
                ContentImage(imageName: 'assets/p7.png'),
              ],
            ),
          ),
          description: '到貓咪先生家了！但是貓咪先生的大門緊閉，兔子先生要想辦法打開大門。',
          buttonHidden: false,
          buttonTapped: (context) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const P8()));
          }),
    );
  }
}
