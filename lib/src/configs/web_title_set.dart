import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart' show BuildContext, Theme;
import 'package:flutter/services.dart' show ApplicationSwitcherDescription, SystemChrome;

Future<void> changeWebTitle(BuildContext context, String title) async {
  if (!kIsWeb) return;
  await SystemChrome.setApplicationSwitcherDescription(
    ApplicationSwitcherDescription(
      label: title,
      primaryColor: Theme.of(context).primaryColor.value,
    ),
  );
}
