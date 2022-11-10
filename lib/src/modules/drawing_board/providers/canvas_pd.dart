import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../enums/drawing_enums.dart';
import '../models/sketch.dart';

final canvasGlobalKeyProvider = Provider<GlobalKey>((_) => GlobalKey());
final selectedColorProvider = StateProvider<Color>((_) => Colors.black);
final strokeSizeProvider = StateProvider<double>((_) => 10.0);
final eraserSizeProvider = StateProvider<double>((_) => 30.0);
final drawingModeProvider =
    StateProvider<DrawingMode>((_) => DrawingMode.pencil);

final currentSketchProvider = StateProvider<Sketch?>((_) => null);
final allSketchesProvider = StateProvider<List<Sketch>>((_) => []);
final redoSketchesProvider = StateProvider<List<Sketch>>((_) => []);

void clearCanvas(WidgetRef ref) {
  ref.read(allSketchesProvider.notifier).update((_) => []);
  ref.read(redoSketchesProvider.notifier).update((_) => []);
  ref.read(currentSketchProvider.notifier).update((_) => null);
}

void undo(WidgetRef ref) {
  final allSketches = ref.read(allSketchesProvider);
  if (allSketches.isNotEmpty) {
    final lastSketch = allSketches.removeLast();
    ref.read(allSketchesProvider.notifier).update((_) => [...allSketches]);
    ref
        .read(redoSketchesProvider.notifier)
        .update((state) => [lastSketch, ...state]);
    ref.read(currentSketchProvider.notifier).update((_) => null);
  }
}

void redo(WidgetRef ref) {
  final redoSketches = ref.read(redoSketchesProvider);
  if (redoSketches.isNotEmpty) {
    final firstSketch = redoSketches.removeAt(0);
    ref
        .read(allSketchesProvider.notifier)
        .update((state) => [...state, firstSketch]);
    ref.read(redoSketchesProvider.notifier).update((_) => [...redoSketches]);
  }
}
