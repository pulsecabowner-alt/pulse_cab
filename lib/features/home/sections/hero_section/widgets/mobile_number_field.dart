import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class MobileNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;

  const MobileNumberField({
    super.key,
    required this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        labelText: 'Mobile Number',
        errorText: errorText,
        floatingLabelStyle: const TextStyle(color: AppColors.textPrimary),
        filled: true,
        fillColor: AppColors.scaffoldBg,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        // 🇮🇳 PREFIX (FLAG + +91)
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('🇮🇳', style: TextStyle(fontSize: 18)),
              SizedBox(width: 6),
              Text(
                '+91',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0),
      ),
    );
  }
}
