import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_routes.dart';
import '../../helpers/constants/constants.dart';
import '../../localization/loalization.dart';
import '../../shared/beamer_history/beamer_history.dart';

class MaintenanceBreak extends StatelessWidget {
  const MaintenanceBreak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    t = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Beamer.of(context).beamToNamed(AppRoutes.settingsRoute);
          printUrlHistory(context);
        },
        child: const Icon(Icons.settings),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svgs/maintenance.svg',
                semanticsLabel: 'Maintenance Break',
                width: size.height * 0.22,
                placeholderBuilder: (_) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const CircularProgressIndicator(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  t!.weAreUnderMaintenance,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
                  textScaleFactor: 1.4,
                ),
              ),
              Text(
                t!.weWillBeBackSoon,
                textScaleFactor: 1.1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  onTap: () async => await launchUrl(
                      Uri.parse('http://sabikrahat.github.io/')),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Row(
                      mainAxisSize: mainMin,
                      children: [
                        const Icon(Icons.engineering),
                        const SizedBox(width: 10.0),
                        Text(
                          t!.contactWithAdmin,
                          textScaleFactor: 0.8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
