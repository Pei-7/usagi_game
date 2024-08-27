import 'package:flutter/material.dart';

import '../common.dart';
import '../usagi_scaffold.dart';
import 'p06.dart';

class P5 extends StatefulWidget {
  const P5({super.key});

  @override
  State<P5> createState() => _P5State();
}

class _P5State extends State<P5> {
  int imageIndex = 1;
  void toggleIndex() {
    setState(() {
      (imageIndex == 1) ? imageIndex = 2 : imageIndex = 1;
    });
  }

  double sliderValue = 255;
  void changeAlpha(double value) {
    setState(() {
      sliderValue = value;
      if (sliderValue.toInt() == 0) {
        showSnackbar(context, '成功移除障礙了！');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return UsagiScaffold(
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QuestionImage(
                imageIndex: imageIndex, alphaValue: sliderValue.toInt()),
            const EbookText(description: '但是前面突然出現了一堵牆，請想方法幫助兔子先生掃除障礙。'),
            SwitchRow(imageIndex: imageIndex, toggleIndex: toggleIndex),
            SliderRow(
                imageIndex: imageIndex,
                sliderValue: sliderValue,
                changeAlpha: changeAlpha),
            NextPageButton(
                isHidden: (sliderValue == 0) ? false : true,
                buttonTapped: (context) {
                  hideSnackbar(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const P6()));
                }),
          ],
        ),
      ),
    );
  }
}

class SliderRow extends StatelessWidget {
  const SliderRow({
    super.key,
    required this.imageIndex,
    required this.sliderValue,
    required this.changeAlpha,
  });

  final int imageIndex;
  final double sliderValue;
  final void Function(double) changeAlpha;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (imageIndex == 1) ? false : true,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lens_blur),
          Slider(
              value: sliderValue,
              min: 0.0,
              max: 255.0,
              thumbColor: themeColorDark,
              activeColor: themeColorDark,
              inactiveColor: Colors.grey,
              onChanged: (value) {
                changeAlpha(value);
                // print(value);
              }),
          const Icon(Icons.circle_rounded),
        ],
      ),
    );
  }
}

class SwitchRow extends StatelessWidget {
  const SwitchRow(
      {super.key, required this.imageIndex, required this.toggleIndex});

  final int imageIndex;
  final void Function() toggleIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.question_mark_outlined),
        const SizedBox(width: 8),
        Switch(
          value: (imageIndex == 1) ? false : true,
          activeColor: themeColorDark,
          inactiveThumbColor: themeColorDark,
          inactiveTrackColor: themeColorLight,
          onChanged: (switchStatus) {
            toggleIndex();
          },
        ),
        const SizedBox(width: 8),
        const Icon(Icons.lightbulb_outline)
      ],
    );
  }
}

class QuestionImage extends StatelessWidget {
  const QuestionImage({
    super.key,
    required this.imageIndex,
    required this.alphaValue,
  });

  final int imageIndex;
  final int alphaValue;

  @override
  Widget build(BuildContext context) {
    return EbookImage(
      imageWidget: SizedBox(
        width: ScreenSize.getStandardWidth(context) * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                flex: 3,
                child: Image.asset(
                  'assets/p5_$imageIndex.png',
                  fit: BoxFit.contain,
                )),
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 32),
                alignment: Alignment.bottomRight,
                color: Color.fromARGB(alphaValue, themeColorDark.red,
                    themeColorDark.green, themeColorDark.blue),
                width: 24,
                height: ScreenSize.getStandardWidth(context) * 0.56,
              ),
            )
          ],
        ),
      ),
    );
  }
}
