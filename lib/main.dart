import 'package:flutter/material.dart';
import 'screens/signup_pro.dart';
import 'screens/search_screen_pro.dart';
import 'screens/signin_pro.dart';
import 'screens/signup.dart';
import 'screens/search_screen.dart';
import 'screens/splashscreen.dart';
import 'screens/firstpage.dart';
import 'screens/secondpage.dart';
import 'screens/thirdpage.dart';
import 'screens/signin.dart';
import 'screens/verification.dart';
import 'screens/welcome.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations_ar.dart';
import 'l10n/app_localizations_en.dart';
import 'l10n/app_localizations_fr.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomeHub',
      localizationsDelegates: const [
        AppLocalizations.delegate, // Generated delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(useMaterial3: true),

      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => Splashscreen());
          case '/pageone':
            return MaterialPageRoute(builder: (_) => Pageone());
          case '/pagetwo':
            return MaterialPageRoute(builder: (_) => Pagetwo());
          case '/pagethree':
            return MaterialPageRoute(builder: (_) => Pagethree());
          case '/welcome':
            return MaterialPageRoute(builder: (_) => Welcome());
          case '/signin':
            return MaterialPageRoute(builder: (_) => Signin());
          case '/verification':
            return MaterialPageRoute(builder: (_) => Verification());
          case '/homescreen':
            return MaterialPageRoute(builder: (_) => HomeScreen());

          case '/signin_pro':
            return MaterialPageRoute(builder: (_) => SigninPro());

          case '/home_screen_pro':
            return MaterialPageRoute(builder: (_) => HomeScreenPro());

          case '/signup':
            return MaterialPageRoute(builder: (_) => Signup());

          case '/signup_pro':
            return MaterialPageRoute(builder: (_) => SignupPro());

          default:
            return MaterialPageRoute(
              builder: (_) =>
                  Scaffold(body: Center(child: Text('404: Page not found'))),
            );
        }
      },
    );
  }
}
