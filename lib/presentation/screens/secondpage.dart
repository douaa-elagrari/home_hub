import '../../utils/utils.dart';

class Pagetwo extends StatelessWidget {
  const Pagetwo({super.key});
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
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
          title: loc.furnishStyleEasily,
          description: loc.furnishStyleDesc,
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

