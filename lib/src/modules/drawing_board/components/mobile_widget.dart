import 'package:bangla_handwritten_math_solver_flutter_app/src/localization/loalization.dart';
import 'package:bangla_handwritten_math_solver_flutter_app/src/modules/drawing_board/components/shared/canvas_banner.dart';
import 'package:flutter/material.dart';

import '../../../configs/responsive_config.dart';
import '../../../helpers/constants/constants.dart';
import '../enums/canvas_type.dart';
import 'shared/drawing_canvas.dart';

class MobileWidget extends StatelessWidget {
  const MobileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: defaultBorderRadius,
              border: Border.all(color: kPrimaryColor, width: 2.0),
            ),
            child: Stack(
              children: [
                DrawingCanvas(
                  height: (size.height * 3) / 5,
                  width: Responsive.isMobile(context)
                      ? size.width
                      : size.width - 300,
                  canvasType: CanvasType.equation,
                ),
                const CanvasBanner(),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: defaultBorderRadius,
              border: Border.all(color: Colors.green, width: 2.0),
            ),
            child: Stack(
              children: [
                DrawingCanvas(
                  height: (size.height * 2) / 5,
                  width: Responsive.isMobile(context)
                      ? size.width
                      : size.width - 300,
                  canvasType: CanvasType.answer,
                ),
                const CanvasBanner(isAnswer: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
