import 'package:flutter/material.dart';
import '../widgets/page.dart';
import '../widgets/button.dart';

class Pagethree extends StatelessWidget {
  const Pagethree({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! > 0) {
            Navigator.pop(context);
          }
        },
        child: Mypage(
          title: 'Grow Your Business ',
          description:
              'Get clients, and grow your professional\n reputation digitally.',
          imagePath: 'assets/images/page1.png',

          circleone: false,
          circletwo: false,
          circlethree: true,
          chevron: true,
        ),
      ),
    );
  }
}
