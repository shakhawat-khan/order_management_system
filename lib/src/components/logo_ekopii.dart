import 'package:flutter/material.dart';

class LogoEkopII extends StatelessWidget {
  final double height;
  const LogoEkopII({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: height,
        width: 400,
        child: Image.asset(
          'assets/ekopii.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low,
        ),
      ),
    );
  }
}
