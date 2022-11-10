import 'package:bangla_handwritten_math_solver_flutter_app/src/configs/responsive_config.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../helpers/constants/constants.dart';
import 'components/canvas_side_bar.dart';
import 'components/drawing_canvas.dart';

class DrawingBoard extends ConsumerWidget {
  const DrawingBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCanvasColor,
        elevation: 1.0,
        centerTitle: true,
        title: const Text(
          'Let\'s draw',
          style: TextStyle(
            color: kTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: Responsive.isMobile(context)
          ? const Drawer(child: CanvasSideBar())
          : null,
      body: Responsive(
        mobile: const DrawingCanvas(),
        desktop: Row(
          children: const [
            CanvasSideBar(),
            Expanded(child: DrawingCanvas()),
          ],
        ),
      ),
    );
  }
}
