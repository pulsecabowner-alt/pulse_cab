import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/constants/app_texts.dart';

class NavbarBrand extends StatelessWidget {
  const NavbarBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.directions_car_filled,
          color: AppColors.primaryBlue,
          size: 28,
        ),
        SizedBox(width: 10),
        Text(
          AppTexts.appName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}
