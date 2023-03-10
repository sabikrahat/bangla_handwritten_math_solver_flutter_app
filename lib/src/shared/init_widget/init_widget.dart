import 'package:flutter/material.dart'
    show
        BuildContext,
        MaterialApp,
        MediaQuery,
        MediaQueryData,
        StatelessWidget,
        Widget;

class KInitWidget extends StatelessWidget {
  const KInitWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: child),
    );
  }
}
