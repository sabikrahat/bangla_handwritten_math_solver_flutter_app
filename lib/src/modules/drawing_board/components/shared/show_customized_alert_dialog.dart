import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/constants/constants.dart';
import '../../../../localization/loalization.dart';
import '../../providers/canvas_pd.dart';

Future<void> showCustomizedAlertDialog(BuildContext context, String qstn,
    String answer, String ansPred, WidgetRef ref) async {
  final size = MediaQuery.of(context).size;
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: SizedBox(
        width: size.width * 0.8 > 500 ? 500 : size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          child: Column(
            mainAxisSize: mainMin,
            children: [
              Image.asset(answer == ansPred
                  ? "assets/gifs/correct.gif"
                  : "assets/gifs/wrong.gif"),
              const SizedBox(height: 20.0),
              Text(
                answer == ansPred ? t!.correct : '${t!.wrong}$answer',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: () {
                  if (answer == ansPred) {
                    ref.read(scorePd.notifier).update((s) => s + 1);
                  } else {
                    ref.read(scorePd.notifier).update((s) => s - 1);
                  }
                  clearCanvas(ref);
                  Navigator.pop(context);
                },
                child: Container(
                  width: 200.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: defaultBorderRadius,
                  ),
                  child: Center(
                    child: Text(
                      t!.next,
                      style:
                          const TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
