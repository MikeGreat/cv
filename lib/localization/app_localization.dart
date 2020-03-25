import 'dart:ui';

import 'package:cv/localization/en.dart';
import 'package:cv/localization/sk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': en,
    'sk': sk,
  };

  String _getValue(String key) =>
    _localizedValues.containsKey(locale.languageCode) ?
    _localizedValues[locale.languageCode][key] :
    _localizedValues['en'][key];

  String get logoText => _getValue('logoText');
  String get landingTabAbout => _getValue('landingTabAbout');
  String get landingTabProfile => _getValue('landingTabProfile');
  String get landingTabPortfolio => _getValue('landingTabPortfolio');
  String get landingTabPlayground => _getValue('landingTabPlayground');
  String get portfolioError => _getValue('portfolioError');
  String get aboutText => _getValue('aboutText');

}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}