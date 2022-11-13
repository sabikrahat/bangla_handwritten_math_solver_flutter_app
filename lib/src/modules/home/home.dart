import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

import '../../helpers/constants/constants.dart';
import '../../localization/loalization.dart';
import '../maintenance_break/maintenance_break.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    t = AppLocalizations.of(context);
    return isMaintenanceBreak
        ? const MaintenanceBreak()
        : const Scaffold(
            body: SafeArea(child: Body()),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     Beamer.of(context).beamToNamed(AppRoutes.settingsRoute);
            //     printUrlHistory(context);
            //   },
            //   child: const Icon(Icons.settings),
            // ),
          );
  }
}
