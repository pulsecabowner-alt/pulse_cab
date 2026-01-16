import 'package:flutter/material.dart';

class Responsive {
  // 🔹 Breakpoints
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  // 🔹 Base design width (Figma / UI design)
  static const double _designWidth = 1440;

  // 🔹 Scale value (width / height / padding)
  static double scale(
    BuildContext context,
    double size, {
    double min = 8,
    double max = 500,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaled = size * (screenWidth / _designWidth);
    return scaled.clamp(min, max);
  }

  // 🔹 Font size helper
  static double font(
    BuildContext context,
    double size, {
    double min = 12,
    double max = 48,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scaled = size * (screenWidth / _designWidth);
    return scaled.clamp(min, max);
  }

  // 🔹 Vertical spacing
  static SizedBox vSpace(BuildContext context, double size) {
    return SizedBox(height: scale(context, size));
  }

  // 🔹 Horizontal spacing
  static SizedBox hSpace(BuildContext context, double size) {
    return SizedBox(width: scale(context, size));
  }
}
