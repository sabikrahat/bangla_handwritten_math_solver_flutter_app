import 'dart:async';

import 'package:beamer/beamer.dart';

import '../../../../app_routes.dart';
import '../../../../localization/loalization.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../configs/responsive_config.dart';
import '../../../../helpers/constants/constants.dart';
import '../../../../models/config/config.dart';
import '../../../../shared/beamer_history/beamer_history.dart';
import '../../../../shared/divider/k_divider.dart';
import '../../../../shared/footer_widget/footer_widget.dart';
import '../../enums/drawing_enums.dart';
import '../../providers/canvas_pd.dart';
import 'color_changer.dart';
import 'icon_box.dart';

class CanvasSideBar extends ConsumerWidget {
  const CanvasSideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locales = ref.watch(localeConfigProvider);
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
              Text(
                t!.drawingTools,
                style: const TextStyle(
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
          Text(
            t!.tools,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
                tooltip: t!.pencil,
              ),
              IconBox(
                iconData: FontAwesomeIcons.eraser,
                selected: ref.watch(drawingModeProvider) == DrawingMode.eraser,
                onTap: () => ref
                    .read(drawingModeProvider.notifier)
                    .update((_) => DrawingMode.eraser),
                tooltip: t!.eraser,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(),
          const SizedBox(height: 10.0),
          Text(
            t!.colors,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const ColorChanger(),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Text(
            t!.size,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  t!.strokeSize,
                  style: const TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w600),
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
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  t!.eraserSize,
                  style: const TextStyle(
                      fontSize: 13.0, fontWeight: FontWeight.w600),
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
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Text(
            t!.actions,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
                child: Text(
                  t!.clear,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    canClearCanvas(ref) || ref.watch(scorePd) != 0
                        ? kSecondaryColor
                        : kFadeTextColor,
                  ),
                ),
                onPressed: canClearCanvas(ref) || ref.watch(scorePd) != 0
                    ? () => resetCanvas(ref)
                    : null,
                child: Text(
                  t!.reset,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(kSecondaryColor),
                ),
                child: Text(
                  t!.showOnGithub,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () => _launchUrl(kGithubRepo),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: mainMin,
            children: [
              Text(locales == Locales.english
                  ? 'Language Change to Bangla'
                  : 'ভাষা পরিবর্তন করুন'),
              const SizedBox(width: 20),
              Switch(
                value: locales == Locales.bengali,
                onChanged: (_) async {
                  await changeLocale(
                    ref,
                    localeType == Locales.english
                        ? Locales.bengali
                        : Locales.english,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            ),
            onPressed: () {
              Beamer.of(context).beamToNamed(AppRoutes.dataCollectRoute);
              printUrlHistory(context);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Text(t!.contributeData),
            ),
          ),
          const SizedBox(height: 50),
          const KFooterWidget(),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
