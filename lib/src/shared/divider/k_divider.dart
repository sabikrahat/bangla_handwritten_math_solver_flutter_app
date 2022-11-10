import 'package:flutter/material.dart';

import '../../helpers/constants/constants.dart';

class KDivider extends StatelessWidget {
  const KDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kPrimaryColor,
      thickness: 2,
    );
  }
}
