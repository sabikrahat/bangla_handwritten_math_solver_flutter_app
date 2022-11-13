import 'package:flutter/material.dart' show BuildContext, Navigator;

import 'responsive_config.dart' show Responsive;

void popIfMobile(BuildContext context) {
  if (Responsive.isMobile(context)) Navigator.pop(context);
}
