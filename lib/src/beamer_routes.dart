import 'package:beamer/beamer.dart'
    show
        BeamGuard,
        BeamPage,
        BeamPageType,
        BeamerDelegate,
        RoutesLocationBuilder;
import 'package:flutter/widgets.dart' show ValueKey;

import 'app_routes.dart' show AppRoutes;
import 'helpers/constants/constants.dart' show appName, isMaintenanceBreak;
import 'modules/about_us/about_us.dart' show AboutUsPage;
import 'modules/home/home.dart' show Home;
import 'modules/settings/settings_page.dart' show SettingsPage;
import 'shared/page_not_found/page_not_found.dart' show KPageNotFound;

final routerDelegate = BeamerDelegate(
  initialPath: AppRoutes.homeRoute,
  notFoundPage: const BeamPage(
    title: 'Page not found - $appName',
    child: KPageNotFound(error: '404 - Page not found!'),
  ),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      AppRoutes.homeRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.homeRoute),
          title: appName,
          type: BeamPageType.slideRightTransition,
          child: Home(),
        );
      },
      AppRoutes.settingsRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.settingsRoute),
          title: '$appName - Settings',
          type: BeamPageType.slideRightTransition,
          child: SettingsPage(),
        );
      },
      AppRoutes.aboutUsRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.settingsRoute),
          title: '$appName - About us',
          type: BeamPageType.slideRightTransition,
          child: AboutUsPage(),
        );
      },
    },
  ),
  guards: [
    BeamGuard(
      pathPatterns: [
        // .../
      ],
      check: (_, __) => !isMaintenanceBreak,
      beamToNamed: (_, __) => AppRoutes.homeRoute,
    ),
  ],
);
