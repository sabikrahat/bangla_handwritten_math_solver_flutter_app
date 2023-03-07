import '../../shared/sounds/sounds_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

import '../../helpers/constants/constants.dart';
import '../../localization/loalization.dart';
import '../maintenance_break/maintenance_break.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    t = AppLocalizations.of(context);
    return isMaintenanceBreak
        ? const MaintenanceBreak()
        : Scaffold(
            body: const SafeArea(child: Body()),
            floatingActionButton: Column(
              mainAxisAlignment: mainEnd,
              children: [
                FloatingActionButton.small(
                  heroTag: null,
                  onPressed: () async => await playCongratulations(),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.small(
                  heroTag: null,
                  onPressed: () async => await playWrong(),
                  child: const Icon(Icons.error_outline),
                ),
              ],
            ),
          );
  }
}
