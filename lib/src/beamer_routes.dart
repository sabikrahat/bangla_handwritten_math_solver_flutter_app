import 'package:beamer/beamer.dart'
    show
        BeamGuard,
        BeamPage,
        BeamPageType,
        BeamerDelegate,
        RoutesLocationBuilder;
import 'package:flutter/widgets.dart' show ValueKey;

import 'app_routes.dart' show AppRoutes;
import 'helpers/constants/constants.dart' show appTitle, isMaintenanceBreak;
import 'modules/about_us/about_us.dart' show AboutUsPage;
import 'modules/data_collect/data_collect_view.dart';
import 'modules/drawing_board/drawing_board.dart';
import 'modules/home/home.dart' show Home;
import 'modules/settings/settings_page.dart' show SettingsPage;
import 'shared/page_not_found/page_not_found.dart' show KPageNotFound;

final routerDelegate = BeamerDelegate(
  initialPath: AppRoutes.homeRoute,
  notFoundPage: const BeamPage(
    title: 'Page not found',
    child: KPageNotFound(error: '404 - Page not found!'),
  ),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      AppRoutes.homeRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.homeRoute),
          title: appTitle,
          type: BeamPageType.slideRightTransition,
          child: Home(),
        );
      },
      AppRoutes.settingsRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.settingsRoute),
          title: 'Settings',
          type: BeamPageType.slideRightTransition,
          child: SettingsPage(),
        );
      },
      AppRoutes.aboutUsRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.settingsRoute),
          title: 'About us',
          type: BeamPageType.slideRightTransition,
          child: AboutUsPage(),
        );
      },
      AppRoutes.drawingBoardRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.drawingBoardRoute),
          title: 'Drawing Board',
          type: BeamPageType.slideRightTransition,
          child: DrawingBoard(),
        );
      },
      AppRoutes.dataCollectRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.dataCollectRoute),
          title: 'Data Collect',
          type: BeamPageType.slideRightTransition,
          child: DataCollectView(),
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
