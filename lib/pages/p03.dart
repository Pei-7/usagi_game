import 'package:flutter/material.dart';

import '../common.dart';
import '../usagi_scaffold.dart';
import 'p04.dart';

class P3 extends StatefulWidget {
  const P3({
    super.key,
  });

  @override
  State<P3> createState() => _P3State();
}

class _P3State extends State<P3> {
  TextEditingController controller = TextEditingController();

  bool _nextButtonHidden = true;
  void buttonToggle() {
    setState(() {
      _nextButtonHidden = false;
      FocusScope.of(context).unfocus();
      showSnackbar(context, '解開這封密信了！');
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
            const EbookText(description: '隨信附上了密碼對照表，請幫助兔子先生解讀這封信：'),
            const QuestionImages(),
            const SizedBox(height: 24),
            AnswerField(
              buttonToggle: buttonToggle,
              controller: controller,
            ),
            NextPageButton(
                isHidden: _nextButtonHidden,
                buttonTapped: (context) {
                  hideSnackbar(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const P4()));
                }),
          ],
        ),
      ),
    );
  }
}

class AnswerField extends StatelessWidget {
  const AnswerField({
    super.key,
    required this.buttonToggle,
    required this.controller,
  });

  final void Function() buttonToggle;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.getStandardWidth(context) * 0.7,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: '請破譯信件的內容',
          labelStyle: const TextStyle(color: Color.fromARGB(255, 56, 56, 56)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: themeColorDark, width: 2.0)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: themeColorDark, width: 1.0)),
          suffixIcon: IconButton(
            onPressed: () {
              (controller.text
                      .toUpperCase()
                      .contains('HELP')) //避免 help/ Help 等因大小寫導致判別錯誤
                  ? buttonToggle()
                  : showIncorrectAlert(context);
            },
            icon: const Icon(Icons.keyboard_return),
            style: IconButton.styleFrom(foregroundColor: themeColorDark),
          ),
        ),
        onSubmitted: (text) {
          (text.toUpperCase().contains('HELP')) //避免 help/ Help 等因大小寫導致判別錯誤
              ? buttonToggle()
              : showIncorrectAlert(context);
        },
      ),
    );
  }

  Future<dynamic> showIncorrectAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const IncorrectDialogue();
        });
  }
}

class IncorrectDialogue extends StatelessWidget {
  const IncorrectDialogue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text(
        '兔子先生說：\n「我想這應該不是貓咪先生想表達的意思。」',
        style: TextStyle(fontSize: 18),
      ),
      content: Text('請再仔細想想看吧！'),
      actions: [
        DismissButton(),
      ],
    );
  }
}

class DismissButton extends StatelessWidget {
  const DismissButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: themeColorDark),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text(
        '好的',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class QuestionImages extends StatelessWidget {
  const QuestionImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: ScreenSize.getStandardWidth(context) * 0.8),
            child: Image.asset('assets/p3_1.png')),
        ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: ScreenSize.getStandardWidth(context) * 0.8),
            child: Image.asset('assets/p3_2.png')),
      ],
    );
  }
}
