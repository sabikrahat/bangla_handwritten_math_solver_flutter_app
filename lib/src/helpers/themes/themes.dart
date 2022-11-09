import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateProvider, WidgetRef;

import '../../database/hive.dart' show Boxes;
import '../../models/config/config.dart' show Configs, Themes;
import 'dark/dark.dart' show darkUiConfig;
import 'light/light.dart' show lightUiConfig;

Themes? get themeType => Boxes.configs
    .get('data', defaultValue: Configs(theme: Themes.light))!
    .theme;

SystemUiOverlayStyle get uiConfig =>
    themeType == Themes.light ? lightUiConfig : darkUiConfig;

final themeConfigProvider = StateProvider<Themes>((ref) {
  return Boxes.configs
      .get('data', defaultValue: Configs(theme: Themes.light))!
      .theme!;
});

Future<void> toggleTheme(WidgetRef ref) async {
  final theme = themeType;
  final newTheme = theme == Themes.light ? Themes.dark : Themes.light;
  await Boxes.configs.put('data', Configs(theme: newTheme));
  ref.read(themeConfigProvider.notifier).update((_) => newTheme);
}
