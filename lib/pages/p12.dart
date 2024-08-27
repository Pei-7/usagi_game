import 'package:flutter/material.dart';
import '../common.dart';
import '../usagi_scaffold.dart';
import 'p13.dart';

class P12 extends StatelessWidget {
  const P12({
    super.key,
    required this.selectedType,
  });

  final String selectedType;

  @override
  Widget build(BuildContext context) {
    return UsagiScaffold(
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EbookText(
                description:
                    '「太好了！\n${typeDescription[selectedType]}」\n\n貓咪先生的約會對象這麼說。',
                heightRatio: 0.4),
            NextPageButton(
                isHidden: false,
                buttonTapped: (context) {
                  hideSnackbar(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const P13()));
                }),
          ],
        ),
      ),
    );
  }
}

Map<String, String> typeDescription = {
  '1': '我就喜歡貓咪先生原本的樣子！',
  '2': '我覺得制服實在是太帥了！',
  '3': '貓咪先生一看就是很熱情善良的貓呢！',
  '4': '貓咪先生一看就很踏實可靠呢！'
};
