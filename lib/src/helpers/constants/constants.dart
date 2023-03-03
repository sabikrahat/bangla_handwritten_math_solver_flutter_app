import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show
        Alignment,
        BorderRadius,
        Color,
        Colors,
        CrossAxisAlignment,
        Gradient,
        LinearGradient,
        MainAxisAlignment,
        MainAxisSize;
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

//
const isMaintenanceBreak = false;
//

const white = Colors.white;
const black = Colors.black;

const kPrimaryColor = Color(0xFF192F59);
const kSecondaryColor = Color.fromARGB(255, 50, 88, 158);
const kCanvasColor = Color(0xfff2f3f7);
const kTextColor = Color(0xFF262626);
const kFadeTextColor = Color.fromARGB(255, 153, 152, 152);

const secondary = Color(0xFFA6A6A6);
const iconGray = Color(0xFF767676);
const primary = Color(0xFF262626);
const primaryBg = Color(0xFFF5F5Fd);
const secondaryBg = Color(0xFFECECF6);
const barBg = Color(0xFFE3E3EE);

DateFormat dateFormat = DateFormat('yyyy-MM-dd');
DateFormat dateDetailormat = DateFormat('MMMM dd, y');
DateFormat timeFormat = DateFormat('hh:mm:ss a');
DateFormat dateTimeFormat = DateFormat('MMMM dd, y hh:mm a');

DateFormat slipFormat = DateFormat('MMMM dd, y hh:mm a');
NumberFormat numberFormat = NumberFormat('#,##,000.0#');

DateTime get getCurrentDateTime => DateTime.now();
String get getCurrentFormattedDate => dateFormat.format(DateTime.now());
String get getCurrentFormattedTime => timeFormat.format(DateTime.now());

String get todayNow => DateFormat('MMMM d, y  hh:mm a').format(DateTime.now());

const String appName = 'bangla_handwritten_math_solver';

const String appTitle = 'Bangla Handwritten Math Solver';

final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final RegExp phoneValidatorRegExp = RegExp(r'^\+[1-9]{1}[0-9]{3,14}$');
final RegExp pwdStrongValidatorRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
final RegExp stringIsUrlRegExp = RegExp(
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)');

const Gradient defaultGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF6CD0FF),
    Color(0xFF1C2E4C),
  ],
);

final allColors = [
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.cyan,
  Colors.purple,
  Colors.pink
];

final defaultBorderRadius = BorderRadius.circular(6.0);
const equCanvasKey = 'equCanvas';
const ansCanvasKey = 'ansCanvas';

const String kGithubRepo =
    'https://github.com/sabikrahat/bangla_handwritten_math_solver_flutter_app';

MainAxisAlignment mainStart = MainAxisAlignment.start;
MainAxisAlignment mainCenter = MainAxisAlignment.center;
MainAxisAlignment mainEnd = MainAxisAlignment.end;
MainAxisAlignment mainSpaceBetween = MainAxisAlignment.spaceBetween;
MainAxisAlignment mainSpaceEvenly = MainAxisAlignment.spaceEvenly;
MainAxisAlignment mainSpaceAround = MainAxisAlignment.spaceAround;

CrossAxisAlignment crossStart = CrossAxisAlignment.start;
CrossAxisAlignment crossCenter = CrossAxisAlignment.center;
CrossAxisAlignment crossEnd = CrossAxisAlignment.end;
CrossAxisAlignment crossStretch = CrossAxisAlignment.stretch;

MainAxisSize mainMax = MainAxisSize.max;
MainAxisSize mainMin = MainAxisSize.min;

const baseLink = kReleaseMode ? 'http://103.113.227.244:1000' : 'http://localhost:1000';
// const baseLink = 'http://103.113.227.244:1000';

const String playStoreUrl = 'https://play.google.com/store/apps/details?id= ';
