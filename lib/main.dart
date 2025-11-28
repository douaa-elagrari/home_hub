import 'package:flutter/material.dart';
import 'presentation/screens/signup_pro.dart';
import 'presentation/screens/search_screen_pro.dart';
import 'presentation/screens/signin_pro.dart';
import 'presentation/screens/signup.dart';
import 'presentation/screens/search_screen.dart';
import 'presentation/screens/splashscreen.dart';
import 'presentation/screens/firstpage.dart';
import 'presentation/screens/secondpage.dart';
import 'presentation/screens/thirdpage.dart';
import 'presentation/screens/signin.dart';
import 'presentation/screens/verification.dart';
import 'presentation/screens/welcome.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations_ar.dart';
import 'l10n/app_localizations_en.dart';
import 'l10n/app_localizations_fr.dart';
import 'l10n/app_localizations.dart';
import 'presentation/screens/addnewdocumentation.dart';
import 'presentation/screens/addnewitem.dart';
import 'presentation/screens/addnewservice.dart';
import 'presentation/screens/buyforms.dart';
import 'presentation/screens/portfolioprojectdesc.dart';
import 'presentation/screens/descriptionscreens.dart';
import 'presentation/screens/ratingpage.dart';
import 'presentation/screens/editprofile.dart';
import 'presentation/screens/loginpage.dart';
import 'presentation/screens/passtoproaccount.dart';

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
      // for testing specific pages, for the one doing the linking
      //home: Adddocumentationpage(),
      // home: Addnewitempage(),
      // home: Addnewservicepage(),
      // home: Buyformspage(),
      // home: ProjectLayout(projectId: 1),
      // home: ProductLayout(),
      //home: Addratingpage(),
      // home: Editprofilepage(),
      // home: Loginpage(),
      //home: Passetoproaccountpage(),
    );
  }
}
