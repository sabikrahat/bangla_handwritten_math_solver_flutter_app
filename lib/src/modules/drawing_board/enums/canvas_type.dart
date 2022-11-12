import '../../../helpers/constants/constants.dart';

enum CanvasType { equation, answer }

// enum extension to String 
extension CanvasTypeExtension on CanvasType {
  String get keyValue {
    switch (this) {
      case CanvasType.equation:
        return equCanvasKey;
      case CanvasType.answer:
        return ansCanvasKey;
    }
  }
}