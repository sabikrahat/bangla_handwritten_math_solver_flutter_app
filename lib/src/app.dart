import 'package:beamer/beamer.dart'
    show BeamerBackButtonDispatcher, BeamerParser;
import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, Widget;
import 'package:flutter_easyloading/flutter_easyloading.dart' show EasyLoading;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import 'beamer_routes.dart' show routerDelegate;
import 'helpers/constants/constants.dart' show appName;
import 'helpers/themes/dark/dark.dart' show darkTheme;
import 'helpers/themes/light/light.dart' show lightTheme;
import 'helpers/themes/themes.dart' show themeConfigProvider;
import 'localization/loalization.dart'
    show
        bnLocale,
        enLocale,
        localeConfigProvider,
        localizationsDelegates,
        onGenerateTitle,
        supportedLocales,
        t;
import 'models/config/config.dart' show Locales, Themes;

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    final locales = ref.watch(localeConfigProvider);
    final themes = ref.watch(themeConfigProvider);
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),
      restorationScopeId: appName,
      onGenerateTitle: onGenerateTitle,
      debugShowCheckedModeBanner: false,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      title: appName,
      locale: locales == Locales.english ? enLocale : bnLocale,
      theme: themes == Themes.light ? lightTheme : darkTheme,
      builder: EasyLoading.init(),
    );
  }
}
