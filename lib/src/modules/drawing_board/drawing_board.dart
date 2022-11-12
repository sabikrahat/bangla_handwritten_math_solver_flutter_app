import 'dart:async';
import 'dart:ui' as ui;

import '../../configs/responsive_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/constants/constants.dart';
import 'api/get_equation_solve_api.dart';
import 'components/desktop_widget.dart';
import 'components/mobile_widget.dart';
import 'components/shared/canvas_side_bar.dart';
import 'enums/canvas_type.dart';
import 'providers/canvas_pd.dart';
import 'dart:convert';

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
  EasyLoading.show();
  debugPrint('>>> Checking...');
  Uint8List? equPngBytes = await getBytes(ref.watch(canvasGlobalKeyProvider(CanvasType.equation.keyValue)));
  Uint8List? ansPngBytes = await getBytes(ref.watch(canvasGlobalKeyProvider(CanvasType.answer.keyValue)));
  // debugPrint('>>> Equation PNG bytes: $equPngBytes');
  // debugPrint('>>> Answer PNG bytes: $ansPngBytes');
  
  if (equPngBytes != null && ansPngBytes != null) {
    String imgEqu = uint8ListToBase64(equPngBytes);
    String imgAns = uint8ListToBase64(ansPngBytes);
    
    // debugPrint('>>> Equation Base64 bytes: $imgEqu');
    // debugPrint('>>> Answer Base64 bytes: $imgAns');

    String result = await getEquationSolveApi(imgEqu, imgAns);
    debugPrint('>>> Result: $result');
    EasyLoading.showSuccess(result);
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

String uint8ListToBase64(Uint8List data) {
  return base64Encode(data);
}