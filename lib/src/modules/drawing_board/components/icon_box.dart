import 'package:flutter/material.dart';

import '../../../helpers/constants/constants.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    Key? key,
    required this.iconData,
    required this.tooltip,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final bool selected;
  final void Function()? onTap;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Colors.grey[900]! : Colors.grey,
            width: 1.5,
          ),
          borderRadius: defaultBorderRadius,
        ),
        child: Tooltip(
          message: tooltip,
          preferBelow: false,
          child: Icon(
            iconData,
            color: selected ? Colors.grey[900] : Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }
}
