import 'package:flutter/material.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color? color;
  final TextAlign align;
  final double height;

  const AppText(
    this.text, {
    super.key,
    required this.size,
    this.weight = FontWeight.w400,
    this.color,
    this.align = TextAlign.start,
    this.height = 1.3,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: Responsive.font(context, size),
        fontWeight: weight,
        color: color ?? AppColors.textPrimary,
        height: height,
      ),
    );
  }
}
