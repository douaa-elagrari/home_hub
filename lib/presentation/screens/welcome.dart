import '../../utils/utils.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centers vertically
          crossAxisAlignment: CrossAxisAlignment.center, // centers horizontally
          children: [
            Text(
              loc.welcomeToHomeHub,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF004E98),
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 30),
            Text(
              loc.homeHubSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 60),
            Mybutton(
              text: loc.hireService,
              bgcolor: Color(0xFF004E98),
              fgcolor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
            ),
            SizedBox(height: 20),
            Mybutton(
              text: loc.provideService,
              bgcolor: Colors.white,
              fgcolor: Color(0xFF004E98),
              onPressed: () {
                Navigator.pushNamed(context, '/signin_pro');
              },
            ),
          ],
        ),
      ),
    );
  }
}

