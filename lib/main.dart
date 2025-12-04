import 'dart:io';

import '../../utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations_ar.dart';
import 'l10n/app_localizations_en.dart';
import 'l10n/app_localizations_fr.dart';
import 'l10n/app_localizations.dart';
import 'logic/cubit/signincubit.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //  Desktop SQLite initialization
  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => SigninCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HomeHub',
        localizationsDelegates: const [
          AppLocalizations.delegate,
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
              return MaterialPageRoute(builder: (_) => SigninForm());
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
      ),
    );
  }
}