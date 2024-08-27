import 'package:flutter/material.dart';

import '../common.dart';
import '../usagi_scaffold.dart';
import 'p09.dart';
import 'package:google_fonts/google_fonts.dart';

class P8 extends StatefulWidget {
  const P8({super.key});

  @override
  State<P8> createState() => _P8State();
}

class _P8State extends State<P8> {
  List<String> code = [];
  String realPassword = '';

  @override
  void initState() {
    super.initState();
    List<int> randomNum = setRandomPassWord();
    for (var i = 0; i <= 3; i++) {
      (realPassword += randomNum[i].toString());
      print(realPassword);
    }
    if (numberCode[3] != null) {
      code = randomNum.map((int i) => numberCode[i]!).toList();
    }
  }

  String inputPassword = '';
  void updatePassWord(String i) {
    setState(() {
      if (i == 'clear') {
        inputPassword = '';
      } else if (inputPassword.length < 4) {
        inputPassword += i;
      }
    });
  }

  bool lock = true;
  void unlock() {
    setState(() {
      lock = false;
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
            const EbookText(description: '兔子先生想起了貓咪先生曾經給過他的密碼提示：'),
            CodeLine(code: code),
            const SizedBox(height: 16),
            InputScreen(inputPassword: inputPassword),
            const SizedBox(height: 16),
            NumberPad(updatePassWord: updatePassWord),
            const SizedBox(height: 16),
            ToolButtons(
              updatePassWord: updatePassWord,
              realPassword: realPassword,
              inputPassword: inputPassword,
              unlock: unlock,
            ),
            const SizedBox(height: 4),
            const HintLine(),
            NextPageButton(
              isHidden: lock,
              buttonTapped: (context) {
                hideSnackbar(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const P9(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class HintLine extends StatelessWidget {
  const HintLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.getStandardWidth(context) * 0.4,
      child: Text(
        '*369 = 1',
        style: GoogleFonts.orbitron(
          textStyle: TextStyle(fontSize: 14, color: themeColorDark),
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}

class ToolButtons extends StatelessWidget {
  const ToolButtons(
      {super.key,
      required this.updatePassWord,
      required this.inputPassword,
      required this.realPassword,
      required this.unlock});

  final void Function(String) updatePassWord;
  final String realPassword;
  final String inputPassword;
  final void Function() unlock;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.getStandardWidth(context) * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NumberButton(
            text: '清除',
            updatePassWord: updatePassWord,
          ),
          NumberButton(
            text: '輸入',
            updatePassWord: updatePassWord,
            realPassword: realPassword,
            inputPassword: inputPassword,
            unlock: unlock,
          ),
        ],
      ),
    );
  }
}

class NumberPad extends StatelessWidget {
  const NumberPad({
    super.key,
    required this.updatePassWord,
  });
  final void Function(String) updatePassWord;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.getStandardWidth(context) * 0.4,
      height: ScreenSize.getStandardWidth(context) * 0.4,
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          for (var i = 1; i <= 9; i++)
            NumberButton(
              text: i.toString(),
              updatePassWord: updatePassWord,
            )
        ],
      ),
    );
  }
}

class InputScreen extends StatelessWidget {
  const InputScreen({
    super.key,
    required this.inputPassword,
  });

  final String inputPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenSize.getStandardWidth(context) * 0.4,
        padding: const EdgeInsets.only(top: 4, bottom: 4, right: 4),
        decoration: BoxDecoration(
            border: Border.all(
                color: themeColorDark, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          inputPassword,
          style: GoogleFonts.orbitron(),
          textAlign: TextAlign.right,
        ));
  }
}

class CodeLine extends StatelessWidget {
  const CodeLine({
    super.key,
    required this.code,
  });

  final List<String> code;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i = 0; i <= 3; i++) ...[
          Text(
            code[i],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          if (i < 3)
            const Text(
              ', ',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
        ],
      ],
    );
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.text,
    required this.updatePassWord,
    this.inputPassword,
    this.realPassword,
    this.unlock,
  });
  final String text;
  final void Function(String) updatePassWord;
  final String? inputPassword;
  final String? realPassword;
  final void Function()? unlock;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (text == '清除') {
          updatePassWord('clear');
        } else if (text == '輸入') {
          if (inputPassword == realPassword) {
            unlock!();
            hideSnackbar(context);
            showSnackbar(context, '密碼正確！');
          } else {
            hideSnackbar(context);
            showSnackbar(context, '密碼錯誤！');
          }
        } else {
          updatePassWord(text);
        }
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: themeColorDark,
          foregroundColor: themeColorLight),
      child: Text(text,
          style: GoogleFonts.orbitron(textStyle: const TextStyle(fontSize: 18)),
          textAlign: TextAlign.center),
    );
  }
}

Map<int, String> numberCode = {
  1: '369',
  2: '123654789',
  3: '12365456987',
  4: '1456369',
  5: '321456987',
  6: '3214789654',
  7: '12369',
  8: '63214569874',
  9: '6321456987',
};

List<int> setRandomPassWord() {
  List<int> numList = List.generate(9, (int i) => i + 1);
  numList.shuffle();
  List<int> randomNum = numList.take(4).toList();
  return randomNum;
}
