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

import '../../constants/constants.dart' show black, kPrimaryColor, white;

SystemUiOverlayStyle darkUiConfig = SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarColor: kPrimaryColor,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.light,
  statusBarColor: kPrimaryColor,
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.nunito().fontFamily,
  colorScheme: const ColorScheme.dark(),
  toggleableActiveColor: white,
  brightness: Brightness.dark,
  primaryColor: black,
  iconTheme: const IconThemeData(color: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey[900],
    foregroundColor: Colors.white,
    elevation: 1.0,
  ),
);
