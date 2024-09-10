import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GlowingText extends StatelessWidget {
  GlowingText(
      {super.key,
      required this.text,
      required this.shadows,
      required this.size,
      this.overflow});

  final String text;
  final List<Shadow> shadows;
  final double size;
  TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        shadows: shadows,
        fontSize: size,
        fontWeight: FontWeight.bold,
        overflow: overflow,
      ),
    );
  }
}
