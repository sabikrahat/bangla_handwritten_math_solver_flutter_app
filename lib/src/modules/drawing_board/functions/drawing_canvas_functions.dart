import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/get_equation_solve_api.dart';
import '../enums/canvas_type.dart';
import '../providers/canvas_pd.dart';

Future<String?> check(WidgetRef ref) async {
  EasyLoading.show();
  debugPrint('>>> Checking...');
  Uint8List? equPngBytes = await getBytes(CanvasType.equation.keyValue, ref);
  Uint8List? ansPngBytes = await getBytes(CanvasType.answer.keyValue, ref);
  // debugPrint('>>> Equation PNG bytes: $equPngBytes');
  // debugPrint('>>> Answer PNG bytes: $ansPngBytes');

  if (equPngBytes != null && ansPngBytes != null) {
    String imgEqu = uint8ListToBase64(equPngBytes);
    String imgAns = uint8ListToBase64(ansPngBytes);

    // debugPrint('>>> Equation Base64 bytes: $imgEqu');
    // debugPrint('>>> Answer Base64 bytes: $imgAns');

    String result = await getEquationSolveApi(imgEqu, imgAns);
    debugPrint('>>> Result: $result');
    return result;
  }
  return null;
}

Future<Uint8List?> getBytes(String keyValue, WidgetRef ref) async {
  // try {
    final key = ref.watch(canvasGlobalKeyProvider(keyValue));
    RenderRepaintBoundary boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();
    return pngBytes;
  // } catch (e) {
  //   EasyLoading.showError('Error: $e');
  //   debugPrint('>>> Error: $e');
  //   return null;
  // }
}



String uint8ListToBase64(Uint8List data) {
  return base64Encode(data);
}
