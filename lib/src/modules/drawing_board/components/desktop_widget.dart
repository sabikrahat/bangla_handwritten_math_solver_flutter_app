import 'package:flutter/material.dart';

import '../../../configs/responsive_config.dart';
import '../../../helpers/constants/constants.dart';
import '../enums/canvas_type.dart';
import 'shared/canvas_side_bar.dart';
import 'shared/drawing_canvas.dart';

class DesktopWidget extends StatelessWidget {
  const DesktopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        const CanvasSideBar(),
        Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: defaultBorderRadius,
                    border: Border.all(color: kPrimaryColor, width: 2.0),
                  ),
                  child: DrawingCanvas(
                    height: (size.height * 3) / 5,
                    width: Responsive.isMobile(context)
                        ? size.width
                        : size.width - 300,
                    canvasType: CanvasType.equation,
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
                  child: DrawingCanvas(
                    height: (size.height * 2) / 5,
                    width: Responsive.isMobile(context)
                        ? size.width
                        : size.width - 300,
                    canvasType: CanvasType.answer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
