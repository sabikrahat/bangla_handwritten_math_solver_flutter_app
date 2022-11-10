import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:bangla_handwritten_math_solver_flutter_app/src/configs/responsive_config.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../helpers/constants/constants.dart';
import 'components/desktop_widget.dart';
import 'components/mobile_widget.dart';
import 'components/shared/canvas_side_bar.dart';
import 'enums/canvas_type.dart';
import 'providers/canvas_pd.dart';
import 'package:universal_html/html.dart' as html;

class DrawingBoard extends ConsumerWidget {
  const DrawingBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCanvasColor,
        elevation: 1.0,
        centerTitle: true,
        title: const Text(
          'Let\'s draw',
          style: TextStyle(
            color: kTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: Responsive.isMobile(context)
          ? const Drawer(child: CanvasSideBar())
          : null,
      body: const Responsive(
        mobile: MobileWidget(),
        desktop: DesktopWidget(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Check'),
        icon: const Icon(Icons.check),
        onPressed: () async => await check(ref),
      ),
    );
  }
}

Future<void> check(WidgetRef ref) async {
  debugPrint('>>> Checking...');
  Uint8List? equPngBytes = await getBytes(
      ref.watch(canvasGlobalKeyProvider(CanvasType.equation.keyValue)));
  debugPrint('>>> Equation PNG bytes: $equPngBytes');
  Uint8List? ansPngBytes = await getBytes(
      ref.watch(canvasGlobalKeyProvider(CanvasType.answer.keyValue)));
  debugPrint('>>> Answer PNG bytes: $ansPngBytes');
  if (equPngBytes != null) {
    await saveFile(equPngBytes, 'bangla-handwritten-equation');
    debugPrint('>>> Equation PNG file saved');
  }
  if (ansPngBytes != null) {
    await saveFile(ansPngBytes, 'bangla-handwritten-answer');
    debugPrint('>>> Answer PNG file saved');
  }
}

Future<Uint8List?> getBytes(GlobalKey key) async {
  RenderRepaintBoundary boundary =
      key.currentContext?.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage();
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List? pngBytes = byteData?.buffer.asUint8List();
  return pngBytes;
}

Future<void> saveFile(Uint8List bytes, String fileName,
    [String extension = 'png']) async {
  if (kIsWeb) {
    html.AnchorElement()
      ..href = '${Uri.dataFromBytes(bytes, mimeType: 'image/$extension')}'
      ..download = '$fileName-${DateTime.now().toIso8601String()}.$extension'
      ..style.display = 'none'
      ..click();
  } else {
    if (Platform.isIOS || Platform.isAndroid) {
      bool status = await Permission.storage.isGranted;

      if (!status) await Permission.storage.request();

      await FileSaver.instance.saveFile(
        '$fileName-${DateTime.now().toIso8601String()}.$extension',
        bytes,
        extension,
        mimeType: MimeType.PNG,
      );
    }
  }
}
