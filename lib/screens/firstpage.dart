import 'package:flutter/material.dart';
import '../widgets/page.dart';
import '../widgets/button.dart';

class Pageone extends StatelessWidget {
  const Pageone({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! < 0) {
            Navigator.pushNamed(context, '/pagetwo');
          }
        },
        child: Mypage(
          title: 'Find Trusted Professionals',
          description:
              'Connect with trusted builders, electricians,\n plumbers, and cleaners — anytime,\n anywhere.',
          imagePath: 'assets/images/page1.png',

          circleone: true,
          circletwo: false,
          circlethree: false,
          chevron: false,
        ),
      ),
    );
  }
}
