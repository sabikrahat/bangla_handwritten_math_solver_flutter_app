import 'package:flutter/cupertino.dart' show Locale;
import 'package:hive/hive.dart' show Hive;

import '../models/config/config.dart'
    show Configs, ConfigsAdapter, LocalesAdapter, Themes, ThemesAdapter;
import 'hive.dart' show BoxNames, Boxes;

class HiveFuntions {
  static void registerHiveAdepters() {
    Hive.registerAdapter(ThemesAdapter());
    Hive.registerAdapter(LocalesAdapter());
    Hive.registerAdapter(ConfigsAdapter());
  }

  static Future<void> openAllBoxes() async {
    await Hive.openBox<Themes>(BoxNames.themes);
    await Hive.openBox<Locale>(BoxNames.locales);
    await Hive.openBox<Configs>(BoxNames.configs);
  }

  static Future<void> closeAllBoxes() async {
    await Boxes.themes.close();
    await Boxes.locales.close();
    await Boxes.configs.close();
  }

  static Future<void> clearAllBoxes() async {
    await Boxes.themes.clear();
    await Boxes.locales.clear();
    await Boxes.configs.clear();
  }

  static Future<void> deleteAllBoxes() async {
    await Hive.deleteBoxFromDisk(BoxNames.themes);
    await Hive.deleteBoxFromDisk(BoxNames.locales);
    await Hive.deleteBoxFromDisk(BoxNames.configs);
  }
}
