import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

import '../../app_routes.dart';
import '../../helpers/constants/constants.dart';
import '../../localization/loalization.dart';
import '../../shared/beamer_history/beamer_history.dart';
import '../maintenance_break/maintenance_break.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    t = AppLocalizations.of(context);
    return isMaintenanceBreak
        ? const MaintenanceBreak()
        : Scaffold(
            body: const SafeArea(
              child: Body(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Beamer.of(context).beamToNamed(AppRoutes.settingsRoute);
                printUrlHistory(context);
              },
              child: const Icon(Icons.settings),
            ),
          );
  }
}
