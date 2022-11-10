import 'dart:async';

import 'package:bangla_handwritten_math_solver_flutter_app/src/configs/responsive_config.dart';
import 'package:bangla_handwritten_math_solver_flutter_app/src/modules/drawing_board/providers/canvas_pd.dart';
import 'package:bangla_handwritten_math_solver_flutter_app/src/shared/divider/k_divider.dart';
import 'package:bangla_handwritten_math_solver_flutter_app/src/shared/footer_widget/footer_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

import '../../../../helpers/constants/constants.dart';
import '../../enums/drawing_enums.dart';
import 'color_changer.dart';
import 'icon_box.dart';

class CanvasSideBar extends ConsumerWidget {
  const CanvasSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: 300,
      height: size.height,
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.compassDrafting,
                size: 30,
                color: kPrimaryColor,
              ),
              const SizedBox(width: 10),
              const Text(
                'Drawing Tools',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              if (Responsive.isMobile(context))
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
            ],
          ),
          const SizedBox(height: 10.0),
          const KDivider(),
          const SizedBox(height: 10.0),
          const Text(
            'Tools',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 5,
            runSpacing: 5,
            children: [
              IconBox(
                iconData: FontAwesomeIcons.pencil,
                selected: ref.watch(drawingModeProvider) == DrawingMode.pencil,
                onTap: () => ref
                    .read(drawingModeProvider.notifier)
                    .update((_) => DrawingMode.pencil),
                tooltip: 'Pencil',
              ),
              IconBox(
                iconData: FontAwesomeIcons.eraser,
                selected: ref.watch(drawingModeProvider) == DrawingMode.eraser,
                onTap: () => ref
                    .read(drawingModeProvider.notifier)
                    .update((_) => DrawingMode.eraser),
                tooltip: 'Eraser',
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(),
          const SizedBox(height: 10.0),
          const Text(
            'Colors',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const ColorChanger(),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          const Text(
            'Size',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Text(
                'Stroke Size:',
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
              ),
              Slider(
                activeColor: kPrimaryColor,
                inactiveColor: kPrimaryColor.withOpacity(0.5),
                value: ref.watch(strokeSizeProvider),
                min: 0,
                max: 50,
                onChanged: (val) => ref
                    .read(strokeSizeProvider.notifier)
                    .update((_) => val.roundToDouble()),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Eraser Size:',
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
              ),
              Slider(
                activeColor: kPrimaryColor,
                inactiveColor: kPrimaryColor.withOpacity(0.5),
                value: ref.watch(eraserSizeProvider),
                min: 0,
                max: 80,
                onChanged: (val) => ref
                    .read(eraserSizeProvider.notifier)
                    .update((_) => val.roundToDouble()),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          const Text(
            'Actions',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            children: [
              // TextButton(
              //   style: ButtonStyle(
              //     foregroundColor: MaterialStateProperty.all(
              //         canUndo(ref) ? kSecondaryColor : kFadeTextColor),
              //   ),
              //   onPressed: canUndo(ref) ? () => undo(ref) : null,
              //   child: const Text(
              //     'Undo',
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //   ),
              // ),
              // TextButton(
              //   style: ButtonStyle(
              //     foregroundColor: MaterialStateProperty.all(
              //         ref.watch(redoSketchesProvider).isNotEmpty
              //             ? kSecondaryColor
              //             : kFadeTextColor),
              //   ),
              //   onPressed: ref.watch(redoSketchesProvider).isNotEmpty
              //       ? () => redo(ref)
              //       : null,
              //   child: const Text(
              //     'Redo',
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //   ),
              // ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    canClearCanvas(ref) ? kSecondaryColor : kFadeTextColor,
                  ),
                ),
                onPressed: canClearCanvas(ref) ? () => clearCanvas(ref) : null,
                child: const Text(
                  'Clear',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(kSecondaryColor),
                ),
                child: const Text(
                  'Show on Github',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () => _launchUrl(kGithubRepo),
              ),
            ],
          ),
          const SizedBox(height: 50),
          const KFooterWidget(),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (kIsWeb) {
      html.window.open(
        url,
        url,
      );
    } else {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    }
  }
}
