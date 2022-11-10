import 'package:flutter/material.dart'
    show
        AppBarTheme,
        Brightness,
        ColorScheme,
        Colors,
        FloatingActionButtonThemeData,
        IconThemeData,
        ThemeData,
        VisualDensity;
import 'package:flutter/services.dart' show Brightness, SystemUiOverlayStyle;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '../../constants/constants.dart' show kPrimaryColor;

SystemUiOverlayStyle lightUiConfig = const SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarColor: kPrimaryColor,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.light,
  statusBarColor: kPrimaryColor,
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.nunito().fontFamily,
  colorScheme: const ColorScheme.light(),
  toggleableActiveColor: kPrimaryColor,
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: kPrimaryColor),
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: kPrimaryColor),
    iconTheme: IconThemeData(color: kPrimaryColor),
  ),
  primaryColor: kPrimaryColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
    elevation: 1.0,
  ),
);
