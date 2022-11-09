import 'package:flutter/material.dart' show BuildContext, Locale;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_localizations/flutter_localizations.dart'
    show
        GlobalCupertinoLocalizations,
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateProvider, WidgetRef;

import '../database/hive.dart' show Boxes;
import '../models/config/config.dart' show Configs, Locales;

AppLocalizations? t;

const localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const supportedLocales = [
  enLocale,
  bnLocale,
];

String onGenerateTitle(BuildContext context) =>
    AppLocalizations.of(context)!.appTitle;

Locales? get localeType => Boxes.configs
    .get('data', defaultValue: Configs(locale: Locales.english))!
    .locale;

final localeConfigProvider = StateProvider<Locales>((ref) {
  return Boxes.configs
      .get('data', defaultValue: Configs(locale: Locales.english))!
      .locale!;
});

Future<void> changeLocale(WidgetRef ref, Locales newLocale) async {
  await Boxes.configs.put('data', Configs(locale: newLocale));
  ref.read(localeConfigProvider.notifier).update((_) => newLocale);
}

const enLocale = Locale('en', '');
const bnLocale = Locale('bn', '');
