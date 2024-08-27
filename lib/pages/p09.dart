import 'package:flutter/material.dart';
import '../common.dart';
import '../usagi_scaffold.dart';
import 'p10.dart';

class P9 extends StatelessWidget {
  const P9({
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
                ContentImage(imageName: 'assets/p9_1.png'),
                ContentImage(imageName: 'assets/p9_2.png'),
              ],
            ),
          ),
          description: '終於打開大門了！貓咪先生探出頭來，非常感激兔子先生及時趕來。',
          buttonHidden: false,
          buttonTapped: (context) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const P10()));
          }),
    );
  }
}
