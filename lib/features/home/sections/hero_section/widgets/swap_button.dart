import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class SwapButton extends StatelessWidget {
  final VoidCallback onTap;
  const SwapButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.swap_vert,
            size: 20,
            color: AppColors.primaryBlue,
          ),
        ),
      ),
    );
  }
}
