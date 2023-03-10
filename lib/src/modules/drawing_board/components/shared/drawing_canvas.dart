import 'package:flutter/material.dart' hide Image;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/constants/constants.dart';
import '../../enums/canvas_type.dart';
import '../../enums/drawing_enums.dart';
import '../../models/sketch.dart';
import '../../providers/canvas_pd.dart';
import 'sketch_painting.dart';

class DrawingCanvas extends ConsumerWidget {
  const DrawingCanvas({
    super.key,
    required this.height,
    required this.width,
    required this.canvasType,
  });

  final double height;
  final double width;
  final CanvasType canvasType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sketch = ref.watch(currentSketchProvider(canvasType.keyValue));
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: RepaintBoundary(
            key: ref.watch(canvasGlobalKeyProvider(canvasType.keyValue)),
            child: Container(
              height: height,
              width: width,
              color: kCanvasColor,
              child: CustomPaint(
                  painter: SketchPainting(
                      ref.watch(allSketchesProvider(canvasType.keyValue)))),
            ),
          ),
        ),
        Listener(
          onPointerDown: (details) =>
              onPointerDown(details, context, ref, canvasType),
          onPointerMove: (details) =>
              onPointerMove(details, context, ref, canvasType),
          onPointerUp: (details) => onPointerUp(details, ref, canvasType),
          child: RepaintBoundary(
            child: SizedBox(
              height: height,
              width: width,
              child: CustomPaint(
                painter: SketchPainting(sketch == null ? [] : [sketch]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onPointerDown(PointerDownEvent details, BuildContext context,
      WidgetRef ref, CanvasType canvasType) {
    final box = context.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(details.position);
    ref.read(currentSketchProvider(canvasType.keyValue).notifier).update(
          (_) => Sketch.fromDrawingMode(
            Sketch(
              points: [offset],
              size: ref.watch(drawingModeProvider) == DrawingMode.eraser
                  ? ref.watch(eraserSizeProvider)
                  : ref.watch(strokeSizeProvider),
              color: ref.watch(drawingModeProvider) == DrawingMode.eraser
                  ? kCanvasColor
                  : ref.watch(selectedColorProvider),
            ),
            // ref.watch(drawingModeProvider),
          ),
        );
  }

  void onPointerMove(PointerMoveEvent details, BuildContext context,
      WidgetRef ref, CanvasType canvasType) {
    final box = context.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(details.position);
    final points = List<Offset>.from(
        ref.watch(currentSketchProvider(canvasType.keyValue))?.points ?? [])
      ..add(offset);
    ref.read(currentSketchProvider(canvasType.keyValue).notifier).update(
          (_) => Sketch.fromDrawingMode(
            Sketch(
              points: points,
              size: ref.watch(drawingModeProvider) == DrawingMode.eraser
                  ? ref.watch(eraserSizeProvider)
                  : ref.watch(strokeSizeProvider),
              color: ref.watch(drawingModeProvider) == DrawingMode.eraser
                  ? kCanvasColor
                  : ref.watch(selectedColorProvider),
            ),
            // ref.watch(drawingModeProvider),
          ),
        );
  }

  void onPointerUp(
      PointerUpEvent details, WidgetRef ref, CanvasType canvasKey) {
    ref.read(allSketchesProvider(canvasType.keyValue).notifier).update(
        (state) =>
            [...state, ref.read(currentSketchProvider(canvasType.keyValue))!]);
    if (ref.watch(lastCanvasChangedProvider) != canvasType) {
      ref.read(lastCanvasChangedProvider.notifier).update((_) => canvasType);
    }
  }
}
