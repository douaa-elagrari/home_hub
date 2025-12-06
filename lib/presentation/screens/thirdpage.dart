import '../../utils/utils.dart';

class Pagethree extends StatelessWidget {
  const Pagethree({super.key});
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! > 0) {
            Navigator.pop(context);
          }
        },
        child: Mypage(
          title: loc.growBusiness,
          description: loc.growBusinessDesc,
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

