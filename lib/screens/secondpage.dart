import 'package:flutter/material.dart';
import '../widgets/page.dart';
import '../widgets/button.dart';

class Pagetwo extends StatelessWidget {
  const Pagetwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! < 0) {
            Navigator.pushNamed(context, '/pagethree');
          } else if (details.primaryDelta! > 0) {
            Navigator.pop(context);
          }
        },
        child: Mypage(
          title: 'Furnish & Style Easily ',
          description:
              'Browse materials, furniture, and design\n ideas that match your style and budget.',
          imagePath: 'assets/images/page2.png',

          circleone: false,
          circletwo: true,
          circlethree: false,
          chevron: false,
        ),
      ),
    );
  }
}
