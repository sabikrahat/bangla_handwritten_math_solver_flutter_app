import 'dart:math' show pi;

import 'package:flutter/material.dart'
    show
        AnimatedBuilder,
        Animation,
        AnimationController,
        BuildContext,
        Center,
        Column,
        FontWeight,
        Image,
        MediaQuery,
        Scaffold,
        SingleTickerProviderStateMixin,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Transform,
        Tween,
        Widget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

import '../../helpers/constants/constants.dart' show mainMin;
import '../../localization/loalization.dart' show t;

class KLoadingWidget extends StatefulWidget {
  const KLoadingWidget({super.key});

  @override
  State<KLoadingWidget> createState() => _KLoadingWidgetState();
}

class _KLoadingWidgetState extends State<KLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    //
    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
    //
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    t = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: mainMin,
          children: [
            AnimatedBuilder(
              animation: animation,
              child: Image.asset(
                'assets/icons/flutter_logo.png',
                height: size.width * 0.04 < 55 ? 55 : size.width * 0.04,
                width: size.width * 0.04 < 55 ? 55 : size.width * 0.04,
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: animation.value,
                  child: child,
                );
              },
            ),
            SizedBox(height: size.width * 0.005 < 7 ? 7 : size.width * 0.005),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: size.width * 0.011 < 13 ? 13 : size.width * 0.011,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
