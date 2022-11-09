import 'package:beamer/beamer.dart' show Beamer;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart' show SystemChrome;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart' show App;
import 'src/database/functions.dart' show HiveFuntions;
import 'src/helpers/constants/constants.dart';
import 'src/helpers/themes/themes.dart' show uiConfig;

Future<void> main() async {
  await _init();
  runApp(const ProviderScope(child: App()));
}

Future<void> _init() async {
  Beamer.setPathUrlStrategy();
  await Hive.initFlutter(appName);
  HiveFuntions.registerHiveAdepters();
  await HiveFuntions.openAllBoxes();
  if (!kIsWeb) WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(uiConfig);
}
