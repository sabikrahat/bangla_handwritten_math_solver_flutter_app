import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../app_routes.dart';
import '../../../helpers/constants/constants.dart';
import '../../../localization/loalization.dart';
import '../../../shared/beamer_history/beamer_history.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
      children: [
        Center(
          child: Text(
            t!.appTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            ),
            onPressed: () {
              Beamer.of(context).beamToNamed(AppRoutes.drawingBoardRoute);
              printUrlHistory(context);
            },
            child: const Text('Proceed to Drawing')),
      ],
    );
  }
}
