import 'package:flutter/material.dart';

import '../common.dart';
import '../usagi_scaffold.dart';
import 'p12.dart';

class P11 extends StatefulWidget {
  const P11({super.key});

  @override
  State<P11> createState() => _P11State();
}

class _P11State extends State<P11> {
  String selectedType = '1';
  void updateSelectedIndex(String newSelection) {
    setState(() {
      selectedType = newSelection;
    });
  }

  bool decided = false;
  String decisionIndex = '1';
  void updateDecision() {
    setState(() {
      decided = true;
      decisionIndex = '2';
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
            const EbookText(
              description: '請你幫忙貓咪先生選出最合適的衣服！',
              heightRatio: 0.12,
            ),
            SelectionButtons(
              selectedType: selectedType,
              decided: decided,
              updateSelectedIndex: updateSelectedIndex,
            ),
            const SizedBox(height: 24),
            EbookImage(
                imageWidget: Image.asset(
                    'assets/p11_${selectedType}_$decisionIndex.png')),
            const SizedBox(height: 24),
            DecisionButton(decided: decided, updateDecision: updateDecision),
            NextPageButton(
                isHidden: (decided == false) ? true : false,
                buttonTapped: (context) {
                  hideSnackbar(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => P12(
                                selectedType: selectedType,
                              )));
                }),
          ],
        ),
      ),
    );
  }
}

class DecisionButton extends StatelessWidget {
  const DecisionButton({
    super.key,
    required this.decided,
    required this.updateDecision,
  });

  final bool decided;
  final void Function() updateDecision;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.getStandardWidth(context) * 0.3,
      child: IgnorePointer(
        ignoring: (decided == false) ? false : true,
        child: ElevatedButton(
          onPressed: () {
            updateDecision();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  (decided == false) ? themeColorDark : Colors.grey),
          child: const Text(
            '決定！',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class SelectionButtons extends StatelessWidget {
  const SelectionButtons({
    super.key,
    required this.selectedType,
    required this.decided,
    required this.updateSelectedIndex,
  });

  final String selectedType;
  final bool decided;
  final void Function(String) updateSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      style: SegmentedButton.styleFrom(
          selectedBackgroundColor: themeColorDark,
          selectedForegroundColor: Colors.white),
      segments: const [
        ButtonSegment<String>(value: '1', label: Text('自然')),
        ButtonSegment<String>(value: '2', label: Text('正義')),
        ButtonSegment<String>(value: '3', label: Text('活力')),
        ButtonSegment<String>(value: '4', label: Text('專業')),
      ],
      selected: {selectedType}, //可多選
      onSelectionChanged: (newSelection) {
        (decided == false) ? updateSelectedIndex(newSelection.first) : null;
        //加 first 原因：錯誤提示 A value of type 'Set<String>' can't be assigned to a variable of type 'String'. Try changing the type of the variable, or casting the right-hand type to 'String'.
      },
    );
  }
}
