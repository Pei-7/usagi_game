import 'package:flutter/material.dart';
import '../common.dart';
import '../usagi_scaffold.dart';
import 'ending.dart';


class P13 extends StatelessWidget {
  const P13({
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
                ContentImage(imageName: 'assets/p13.png'),
              ],
            ),
          ),
          description: '實在是太感謝你與兔子先生一起幫助貓咪先生約會成功了！',
          buttonHidden: false,
          buttonTapped: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Ending()),
            );
          }),
    );
  }
}