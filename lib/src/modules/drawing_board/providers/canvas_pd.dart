import '../../../helpers/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../enums/canvas_type.dart';
import '../enums/drawing_enums.dart';
import '../models/sketch.dart';

final canvasGlobalKeyProvider =
    Provider.family<GlobalKey, String>((_, __) => GlobalKey());
final selectedColorProvider = StateProvider<Color>((_) => Colors.black);
final strokeSizeProvider = StateProvider<double>((_) => 10.0);
final eraserSizeProvider = StateProvider<double>((_) => 30.0);
final drawingModeProvider =
    StateProvider<DrawingMode>((_) => DrawingMode.pencil);

final currentSketchProvider =
    StateProvider.family<Sketch?, String>((_, __) => null);
final allSketchesProvider =
    StateProvider.family<List<Sketch>, String>((_, __) => []);
final redoSketchesProvider = StateProvider<List<Sketch>>((_) => []);

final lastCanvasChangedProvider = StateProvider<CanvasType?>((_) => null);

bool canClearCanvas(WidgetRef ref) {
  final equSketches = ref.watch(allSketchesProvider(equCanvasKey));
  final ansSketches = ref.watch(allSketchesProvider(ansCanvasKey));
  return equSketches.isNotEmpty || ansSketches.isNotEmpty;
}

void clearCanvas(WidgetRef ref) {
  ref.read(allSketchesProvider(equCanvasKey).notifier).update((_) => []);
  ref.read(allSketchesProvider(ansCanvasKey).notifier).update((_) => []);
  ref.read(redoSketchesProvider.notifier).update((_) => []);
  ref.read(currentSketchProvider(equCanvasKey).notifier).update((_) => null);
  ref.read(currentSketchProvider(ansCanvasKey).notifier).update((_) => null);
}

bool canUndo(WidgetRef ref) {
  final equSketches = ref.watch(allSketchesProvider(equCanvasKey));
  final ansSketches = ref.watch(allSketchesProvider(ansCanvasKey));
  return equSketches.isNotEmpty || ansSketches.isNotEmpty;
}

void undo(WidgetRef ref) {
  final equSketches = ref.watch(allSketchesProvider(equCanvasKey));
  final ansSketches = ref.watch(allSketchesProvider(ansCanvasKey));
  if (ref.watch(lastCanvasChangedProvider) == CanvasType.equation) {
    if (equSketches.isNotEmpty) {
      final lastSketch = equSketches.removeLast();
      ref.read(allSketchesProvider(equCanvasKey).notifier).update((_) => [...equSketches]);
      ref
          .read(redoSketchesProvider.notifier)
          .update((state) => [lastSketch, ...state]);
      ref.read(currentSketchProvider(equCanvasKey).notifier).update((_) => null);
    }
  } else {
    if (ansSketches.isNotEmpty) {
      final lastSketch = ansSketches.removeLast();
      ref.read(allSketchesProvider(ansCanvasKey).notifier).update((_) => [...ansSketches]);
      ref
          .read(redoSketchesProvider.notifier)
          .update((state) => [lastSketch, ...state]);
      ref.read(currentSketchProvider(ansCanvasKey).notifier).update((_) => null);
    }
  }
}

void undoOld(WidgetRef ref) {
  // final equSketches = ref.watch(allSketchesProvider(equCanvasKey));
  // final ansSketches = ref.watch(allSketchesProvider(ansCanvasKey));
  // final allSketches = ref.read(allSketchesProvider);
  // if (allSketches.isNotEmpty) {
  //   final lastSketch = allSketches.removeLast();
  //   ref.read(allSketchesProvider.notifier).update((_) => [...allSketches]);
  //   ref
  //       .read(redoSketchesProvider.notifier)
  //       .update((state) => [lastSketch, ...state]);
  //   ref.read(currentSketchProvider.notifier).update((_) => null);
  // }
}

void redo(WidgetRef ref) {
  // final redoSketches = ref.read(redoSketchesProvider);
  // if (redoSketches.isNotEmpty) {
  //   final firstSketch = redoSketches.removeAt(0);
  //   ref
  //       .read(allSketchesProvider.notifier)
  //       .update((state) => [...state, firstSketch]);
  //   ref.read(redoSketchesProvider.notifier).update((_) => [...redoSketches]);
  // }
}
