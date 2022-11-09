import 'package:flutter/material.dart'
    show
        BuildContext,
        EdgeInsets,
        InkWell,
        Key,
        MaterialTapTargetSize,
        Padding,
        Radio,
        Row,
        StatelessWidget,
        Text,
        TextStyle,
        VisualDensity,
        Widget;

import '../../helpers/constants/constants.dart' show mainCenter, mainMin;

class KRadioButton extends StatelessWidget {
  const KRadioButton({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    required this.groupValue,
    required this.onLabelTap,
    this.style,
  }) : super(key: key);

  final String label;
  final int value;
  final int groupValue;
  final void Function(int?)? onChanged;
  final void Function() onLabelTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainCenter,
      mainAxisSize: mainMin,
      children: [
        Radio(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        InkWell(
          onTap: onLabelTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(label, style: style),
          ),
        ),
      ],
    );
  }
}
