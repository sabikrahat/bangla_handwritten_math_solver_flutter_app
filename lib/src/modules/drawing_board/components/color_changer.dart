import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/constants/constants.dart';
import '../providers/canvas_pd.dart';

class ColorChanger extends ConsumerWidget {
  const ColorChanger({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 2,
          runSpacing: 2,
          children: [
            for (Color color in allColors)
              GestureDetector(
                onTap: () => ref
                    .read(selectedColorProvider.notifier)
                    .update((_) => color),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                      color: ref.watch(selectedColorProvider) == color
                          ? Colors.blue
                          : Colors.grey,
                      width: 1.5,
                    ),
                    borderRadius: defaultBorderRadius,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: ref.watch(selectedColorProvider),
                border: Border.all(color: Colors.blue, width: 1.5),
                borderRadius: defaultBorderRadius,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: ref.watch(selectedColorProvider),
                          onColorChanged: (value) => ref
                              .read(selectedColorProvider.notifier)
                              .update((_) => value),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Done'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  },
                );
              },
              child: SvgPicture.asset(
                'assets/svgs/color_wheel.svg',
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
