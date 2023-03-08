import 'package:flutter/material.dart';

import '../../../../helpers/constants/constants.dart';
import '../../../../localization/loalization.dart';

class CanvasBanner extends StatelessWidget {
  const CanvasBanner({
    super.key,
    this.isAnswer = false,
  });

  final bool isAnswer;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: isAnswer ? Colors.green : kPrimaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Text(
          isAnswer ? t!.answerPart : t!.equationPart,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
