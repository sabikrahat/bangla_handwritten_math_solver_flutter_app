import '../../../helpers/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../localization/loalization.dart';

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
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
