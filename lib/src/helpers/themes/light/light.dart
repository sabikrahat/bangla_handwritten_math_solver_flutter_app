import 'package:flutter/material.dart'
    show
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

SystemUiOverlayStyle lightUiConfig = SystemUiOverlayStyle(
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
  iconTheme: IconThemeData(color: kPrimaryColor),
  primaryColor: kPrimaryColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
    elevation: 1.0,
  ),
);
