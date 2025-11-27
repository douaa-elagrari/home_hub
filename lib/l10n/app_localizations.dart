import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart' as ar;
import 'app_localizations_en.dart' as en;
import 'app_localizations_fr.dart' as fr;

abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = [
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
  ];

  // Core keys
  String get welcome;
  String get hello;
  String get signin;
  String get signup;
  String get search;
  String get verification;
  String get homescreen;

  // HomeScreen
  String get services;
  String get username;
  String get welcomeBack;

  // Professional titles
  String get architect;
  String get plumber;
  String get carpenter;

  // Locations
  String get algiers;
  String get oran;
  String get constantine;
  String get blida;

  // Today Offers / Featured Property
  String get todayOffers;
  String get featuredProperty;
  String get price;
  // OfferCard-specific
  String get testimonial; // e.g., "testimonial"
  String get homeCleaning; // e.g., "Home Cleaning"
  String get claimOffer; // e.g., "Claim Offer"

  String get details;
  String get contact;
  String get noFavoritesYet;
  String get products;
  String get agencies;
}

// ---------------- LocalizationsDelegate ----------------
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      ['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

// ---------------- Lookup ----------------
AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'ar':
      return ar.AppLocalizationsAr();
    case 'en':
      return en.AppLocalizationsEn();
    case 'fr':
      return fr.AppLocalizationsFr();
  }
  throw FlutterError('Unsupported locale "$locale"');
}
