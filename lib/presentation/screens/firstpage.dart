import '../../utils/utils.dart';

class Pageone extends StatelessWidget {
  const Pageone({super.key});
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! < 0) {
            Navigator.pushNamed(context, '/pagetwo');
          }
        },
        child: Mypage(
          title: loc.findTrustedProfessionals,
          description: loc.findTrustedDesc,
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


