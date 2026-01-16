import 'package:flutter/material.dart';
import 'app_text.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class AppTextsUI {
  static Widget h1(
    String text, {
    TextAlign align = TextAlign.center,
    Color color = AppColors.white,
  }) {
    return AppText(
      text,
      size: 74,
      weight: FontWeight.bold,
      color: color,
      align: align,
    );
  }

  static Widget h2(
    String text, {
    TextAlign align = TextAlign.center,
    Color color = Colors.white70,
  }) {
    return AppText(
      text,
      size: 40,
      weight: FontWeight.w500,
      color: color,
      align: align,
    );
  }

  static Widget body(
    String text, {
    TextAlign align = TextAlign.center,
    Color color = AppColors.textSecondary,
  }) {
    return AppText(text, size: 28, color: color, align: align);
  }
}
