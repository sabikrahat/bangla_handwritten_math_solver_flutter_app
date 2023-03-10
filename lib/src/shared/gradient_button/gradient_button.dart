import 'package:flutter/material.dart'
    show
        BorderRadiusGeometry,
        BoxDecoration,
        BuildContext,
        Colors,
        Container,
        ElevatedButton,
        Gradient,
        RoundedRectangleBorder,
        StatelessWidget,
        VoidCallback,
        Widget;

import '../../helpers/constants/constants.dart'
    show defaultBorderRadius, defaultGradient;

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.gradient = defaultGradient,
    this.borderRadius,
    this.width,
    this.height = 42.0,
  });

  final Widget child;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? defaultBorderRadius;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
