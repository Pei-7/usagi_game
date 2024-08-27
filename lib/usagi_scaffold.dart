import 'package:flutter/material.dart';
import 'common.dart';
import 'pages/cover.dart';
import 'pages/solution.dart';

class UsagiScaffold extends StatelessWidget {
  final Widget content;
  final bool? isCover;

  const UsagiScaffold({
    super.key,
    required this.content,
    this.isCover,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColorLight,
      appBar: AppBar(
        backgroundColor: themeColorLight,
        leading: (isCover == true)
            ? null //不改變 drawer 按鈕
            : IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.of(context).pop(); // 返回上一頁
                },
              ),
      ),
      drawer: const UsagiDrawer(),
      body: Center(
        child: Container(
          color: themeColorLight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: content,
          ),
        ),
      ),
    );
  }
}

class UsagiDrawer extends StatelessWidget {
  const UsagiDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: themeColorDark,
      child: Column(
        children: [
          DrawerHeader(child: Image.asset('assets/drawerIcon.png')),
          // const HomePageTile(),
          // const SolutionTile(),
          const DrawerListTile(tileName: '首頁', navigatePage: Cover()),
          const DrawerListTile(tileName: '解答', navigatePage: Solution()),
          const Spacer(),
          const CreditTile(),
        ],
      ),
    );
  }
}

class CreditTile extends StatelessWidget {
  const CreditTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text('Usage Quest uses illustrations from chojugiga.com',
            style: TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }
}

// class SolutionTile extends StatelessWidget {
//   const SolutionTile({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: const Text('解答', style: TextStyle(color: Colors.white)),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const Solution(),
//           ),
//         );
//       },
//     );
//   }
// }

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.tileName,
    required this.navigatePage,
  });

  final String tileName;
  final Widget navigatePage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tileName, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => navigatePage),
          (Route<dynamic> route) => false, // 移除所有之前的路由
        );
      },
    );
  }
}

// class HomePageTile extends StatelessWidget {
//   const HomePageTile({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: const Text('首頁', style: TextStyle(color: Colors.white)),
//       onTap: () {
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => const Cover()),
//           (Route<dynamic> route) => false, // 移除所有之前的路由
//         );
//       },
//     );
//   }
// }

class Ebook extends StatelessWidget {
  const Ebook({
    super.key,
    required this.imageWidget,
    required this.description,
    required this.buttonHidden,
    required this.buttonTapped,
    this.isTitle,
    this.buttonText,
  });

  final Widget imageWidget;
  final String description;
  final bool buttonHidden;
  final Function(BuildContext) buttonTapped;
  final bool? isTitle;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        EbookImage(imageWidget: imageWidget),
        EbookText(description: description, isTitle: isTitle),
        NextPageButton(
            isHidden: buttonHidden,
            buttonTapped: buttonTapped,
            isTitle: isTitle,
            buttonText: buttonText),
      ],
    );
  }
}

class EbookText extends StatelessWidget {
  const EbookText({
    super.key,
    required this.description,
    this.heightRatio,
    this.isTitle,
  });

  final String description;
  final double? heightRatio;
  final bool? isTitle;

  @override
  Widget build(BuildContext context) {
    double ratio = (heightRatio != null) ? heightRatio! : 0.24;

    return SizedBox(
      width: ScreenSize.getStandardWidth(context),
      height: ScreenSize.getStandardWidth(context) * ratio,
      child: Text(
        description,
        style: TextStyle(
            fontSize: (isTitle != null) ? 24 : 18,
            fontWeight:
                (isTitle != null) ? FontWeight.bold : FontWeight.normal),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class EbookImage extends StatelessWidget {
  const EbookImage({
    super.key,
    required this.imageWidget,
  });

  final Widget imageWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.getStandardWidth(context) * 0.8,
      height: ScreenSize.getStandardWidth(context) * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: imageWidget),
        ],
      ),
    );
  }
}

class NextPageButton extends StatelessWidget {
  final bool isHidden;
  final Function(BuildContext) buttonTapped;
  final bool? isTitle;
  final String? buttonText;

  const NextPageButton(
      {super.key,
      required this.isHidden,
      required this.buttonTapped,
      this.isTitle,
      this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      width: ScreenSize.getStandardWidth(context),
      height: ScreenSize.getStandardWidth(context) * 0.2,
      alignment: (isTitle != null) ? Alignment.center : Alignment.centerRight,
      child: IgnorePointer(
        ignoring: (isHidden == true) ? true : false,
        child: TextButton(
          onPressed: () {
            buttonTapped(context);
          },
          child: SizedBox(
            width: ScreenSize.getStandardWidth(context) * 0.24,
            child: (isTitle == true && buttonText != null)
                ? Text(
                    buttonText!,
                    style: TextStyle(color: themeColorDark),
                    textAlign: TextAlign.center,
                  )
                : Icon(Icons.trending_flat,
                    color:
                        (isHidden == true) ? Colors.transparent : Colors.black,
                    size: 48),
          ),
        ),
      ),
    );
  }
}

class ContentImage extends StatelessWidget {
  const ContentImage({
    super.key,
    required this.imageName,
  });

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Image.asset(
        imageName,
        fit: BoxFit.contain,
      ),
    );
  }
}
