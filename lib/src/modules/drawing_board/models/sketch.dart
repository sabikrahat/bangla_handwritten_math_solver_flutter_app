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

  Map<String, dynamic> toJson() {
    List<Map> pointsMap = points.map((e) => {'dx': e.dx, 'dy': e.dy}).toList();
    return {
      'points': pointsMap,
      'color': color.toHex(),
      'size': size,
    };
  }

  factory Sketch.fromJson(Map<String, dynamic> json) {
    List<Offset> points =
        (json['points'] as List).map((e) => Offset(e['dx'], e['dy'])).toList();
    return Sketch(
      points: points,
      color: (json['color'] as String).toColor(),
      size: json['size'],
    );
  }
}

// enum SketchType { scribble, line, square, circle, polygon }

// extension SketchTypeX on SketchType {
//   toRegularString() => toString().split('.')[1];
// }

// extension SketchTypeExtension on String {
//   toSketchTypeEnum() =>
//       SketchType.values.firstWhere((e) => e.toString() == 'SketchType.${this}');
// }

extension ColorExtension on String {
  Color toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    } else {
      return Colors.black;
    }
  }
}

extension ColorExtensionX on Color {
  String toHex() => '#${value.toRadixString(16).substring(2, 8)}';
}
