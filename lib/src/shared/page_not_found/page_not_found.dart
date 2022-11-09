import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Colors,
        Column,
        FontWeight,
        Key,
        MediaQuery,
        Scaffold,
        SingleChildScrollView,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

import '../../helpers/constants/constants.dart' show mainCenter, mainMin;
import '../beamer_history/beamer_history.dart' show printUrlHistory;

class KPageNotFound extends StatelessWidget {
  const KPageNotFound({
    Key? key,
    required this.error,
  }) : super(key: key);

  final Object error;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    printUrlHistory(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: mainMin,
            mainAxisAlignment: mainCenter,
            children: [
              SvgPicture.asset(
                'assets/svgs/error.svg',
                height: size.width * 0.35,
                width: size.width * 0.35,
              ),
              Text(
                'Error: $error',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
