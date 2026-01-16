import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/core/widgets/app_text.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Responsive.scale(context, 24)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🔹 ICON
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: Responsive.scale(context, 32, min: 24, max: 36),
              color: AppColors.primaryBlue,
            ),
          ),

          Responsive.vSpace(context, 20),

          // 🔹 TITLE
          AppText(
            title,
            size: 16,
            weight: FontWeight.bold,
            color: AppColors.textPrimary,
            align: TextAlign.center,
          ),

          Responsive.vSpace(context, 12),

          // 🔹 DESCRIPTION
          AppText(
            description,
            size: 14,
            color: AppColors.textSecondary,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
