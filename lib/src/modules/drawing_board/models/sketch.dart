import 'package:flutter/material.dart';

import '../enums/drawing_enums.dart';

class Sketch {
  final List<Offset> points;
  final Color color;
  final double size;

  Sketch({
    required this.points,
    this.color = Colors.black,
    required this.size,
  });

  factory Sketch.fromDrawingMode(
      Sketch sketch, DrawingMode drawingMode) {
    return Sketch(
      points: sketch.points,
      color: sketch.color,
      size: sketch.size,
    );
  }
}