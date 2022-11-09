import 'package:flutter/cupertino.dart' show Locale;
import 'package:hive/hive.dart' show Hive;

import '../models/config/config.dart' show Configs, Themes;

class Boxes {
  static var themes = Hive.box<Themes>(BoxNames.themes);
  static var locales = Hive.box<Locale>(BoxNames.locales);
  static var configs = Hive.box<Configs>(BoxNames.configs);
}

class BoxNames {
  static const String themes = 'themes';
  static const String locales = 'locales';
  static const String configs = 'configs';
}

class HiveTypes {
  static const int themes = 0;
  static const int locales = 1;
  static const int configs = 2;
}
