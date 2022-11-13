import 'package:beamer/beamer.dart' show Beamer;
import 'package:flutter/cupertino.dart' show BuildContext;

import '../../utils/logger/logger_helper.dart' show log;

void printUrlHistory(BuildContext context) => log.i(
    'History: ${Beamer.of(context).beamingHistory.map((e) => e.history.map((v) => v.routeInformation.location)).toList()}');
