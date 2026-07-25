import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class BookingCTASection extends StatelessWidget {
  const BookingCTASection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryBlue, Color(0xFF0A3D91)],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Ready to book your ride?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'Safe, reliable & affordable cab service across India',
            style: TextStyle(fontSize: 15, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryBlue,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // scroll to Hero / booking card (next step)
              },
              child: const Text(
                'Book Now',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
