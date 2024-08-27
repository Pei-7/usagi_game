import 'package:flutter/material.dart';
import '../common.dart';
import '../usagi_scaffold.dart';

class Solution extends StatelessWidget {
  const Solution({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: themeColorLight,
          appBar: AppBar(
            backgroundColor: themeColorLight,
            title: const Text(''),
            bottom: TabBar(
              labelColor: themeColorDark,
              dividerColor: themeColorDark,
              indicatorColor: themeColorDark,
              tabs: const [
                Tab(text: '密信解謎'),
                Tab(text: '牆壁障礙'),
                Tab(text: '門鎖密碼'),
              ],
            ),
          ),
          drawer: const UsagiDrawer(),
          body: TabBarView(children: [
            SizedBox(
                width: ScreenSize.getStandardWidth(context),
                child: Image.asset('assets/solution_1.png')),
            SizedBox(
                width: ScreenSize.getStandardWidth(context),
                child: Image.asset('assets/solution_2.png')),
            SizedBox(
                width: ScreenSize.getStandardWidth(context),
                child: Image.asset('assets/solution_3.png')),
          ])),
    );
  }
}
