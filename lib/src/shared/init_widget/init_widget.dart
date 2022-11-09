import 'package:flutter/material.dart'
    show
        BuildContext,
        Key,
        MaterialApp,
        MediaQuery,
        MediaQueryData,
        StatelessWidget,
        Widget;

class KInitWidget extends StatelessWidget {
  const KInitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: child),
    );
  }
}
