import 'package:beamer/beamer.dart' show Beamer;
import '../../utils/logger/logger_helper.dart' show log;
import 'package:flutter/cupertino.dart' show BuildContext;

void printUrlHistory(BuildContext context) => log.i(
    'History: ${Beamer.of(context).beamingHistory.map((e) => e.history.map((v) => v.routeInformation.location)).toList()}');
