import 'package:flutter/material.dart';
import 'package:recipe_app/utilities/colores.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  late PageController pageController;
  bool showBtns = false;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    initListener();
    showBtnsFunc();
    super.initState();
  }

  void initListener() async {
    await Future.delayed(const Duration(milliseconds: 100));
    pageController.addListener(() {
      setState(() {});
    });
  }

  void showBtnsFunc() async {
    await Future.delayed(const Duration(milliseconds: 120));
    showBtns = true;
    setState(() {});
  }

  ButtonStyle? buttonStyle(int index) {
    return (index == pageController.page?.toInt())
        ? TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: ColoresConst.mainColor)
        : null;
  }

  void onTapOnBtn(int index) async {
    await pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (showBtns)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: buttonStyle(0),
                      onPressed: () => onTapOnBtn(0),
                      child: Text('first page')),
                  TextButton(
                      style: buttonStyle(1),
                      onPressed: () => onTapOnBtn(1),
                      child: Text('second page')),
                  TextButton(
                      style: buttonStyle(2),
                      onPressed: () => onTapOnBtn(2),
                      child: Text('third page')),
                ],
              ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                // physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.yellow,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
