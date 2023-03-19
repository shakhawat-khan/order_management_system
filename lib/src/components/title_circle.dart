import 'package:flutter/material.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';

class TitelCircle extends StatelessWidget {
  final Color color;
  final String text;
  const TitelCircle({
    required this.color,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 11,
          width: 11,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        gapW8,
        Text(text)
      ],
    );
  }
}
