import 'package:bangla_handwritten_math_solver_flutter_app/src/configs/responsive_config.dart';
import 'package:bangla_handwritten_math_solver_flutter_app/src/modules/drawing_board/components/sketch_painting.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/constants/constants.dart';
import '../enums/drawing_enums.dart';
import '../models/sketch.dart';
import '../providers/canvas_pd.dart';

class DrawingCanvas extends ConsumerWidget {
  const DrawingCanvas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = Responsive.isMobile(context) ? size.width : size.width - 300;
    final sketch = ref.watch(currentSketchProvider);
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: RepaintBoundary(
            key: canvasGlobalKey,
            child: Container(
              height: height,
              width: width,
              color: kCanvasColor,
              child: CustomPaint(painter: SketchPainting(ref.watch(allSketchesProvider))),
            ),
          ),
        ),
        Listener(
          onPointerDown: (details) => onPointerDown(details, context, ref),
          onPointerMove: (details) => onPointerMove(details, context, ref),
          onPointerUp: (details) => onPointerUp(details, ref),
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

  void onPointerDown(
      PointerDownEvent details, BuildContext context, WidgetRef ref) {
    final box = context.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(details.position);
    ref.read(currentSketchProvider.notifier).update(
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
            ref.watch(drawingModeProvider),
          ),
        );
  }

  void onPointerMove(
      PointerMoveEvent details, BuildContext context, WidgetRef ref) {
    final box = context.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(details.position);
    final points =
        List<Offset>.from(ref.watch(currentSketchProvider)?.points ?? [])
          ..add(offset);
    ref.read(currentSketchProvider.notifier).update(
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
            ref.watch(drawingModeProvider),
          ),
        );
  }

  void onPointerUp(PointerUpEvent details, WidgetRef ref) => ref
      .read(allSketchesProvider.notifier)
      .update((state) => [...state, ref.read(currentSketchProvider)!]);
}

