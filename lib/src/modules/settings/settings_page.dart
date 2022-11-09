import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_routes.dart';
import '../../helpers/constants/constants.dart';
import '../../helpers/themes/themes.dart';
import '../../localization/loalization.dart';
import '../../models/config/config.dart';
import '../../shared/beamer_history/beamer_history.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    final themes = ref.watch(themeConfigProvider);
    final locales = ref.watch(localeConfigProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Beamer.of(context).beamToNamed(AppRoutes.aboutUsRoute);
          printUrlHistory(context);
        },
        child: const Icon(Icons.info_rounded),
      ),
      body: Center(
        child: Column(
          mainAxisSize: mainMin,
          children: [
            Text(
              t!.settings,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: mainMin,
              children: [
                Text(themes == Themes.light
                    ? 'Theme Change to Dark'
                    : 'Theme Change to Light'),
                const SizedBox(width: 20),
                Switch(
                  value: themes == Themes.dark,
                  onChanged: (_) async => await toggleTheme(ref),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: mainMin,
              children: [
                Text(locales == Locales.english
                    ? 'Locale Change to Bangla'
                    : 'Locale Change to English'),
                const SizedBox(width: 20),
                Switch(
                  value: locales == Locales.bengali,
                  onChanged: (_) async {
                    await changeLocale(
                      ref,
                      localeType == Locales.english
                          ? Locales.bengali
                          : Locales.english,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
