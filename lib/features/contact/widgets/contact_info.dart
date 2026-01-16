import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Get in touch',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        _info(Icons.call, '+91 99999 99999'),
        const SizedBox(height: 16),
        _info(Icons.message, 'WhatsApp Support'),
        const SizedBox(height: 16),
        _info(Icons.email, 'support@pulsecab.com'),
        const SizedBox(height: 32),

        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.scaffoldBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'Map Placeholder',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _info(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryBlue),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(fontSize: 15, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
