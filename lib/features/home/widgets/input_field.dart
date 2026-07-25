import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? errorText;

  const InputField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        floatingLabelStyle: const TextStyle(color: AppColors.darkBg),
        filled: true,
        fillColor: AppColors.scaffoldBg,
        contentPadding: const EdgeInsets.fromLTRB(16, 16, 44, 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
