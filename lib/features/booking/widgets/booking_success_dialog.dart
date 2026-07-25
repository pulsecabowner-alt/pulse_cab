import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class BookingSuccessDialog extends StatelessWidget {
  const BookingSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      backgroundColor: AppColors.scaffoldBg,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ✅ Icon
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 42,
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Title
            const Text(
              'Request Sent Successfully',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // ✅ Message
            const Text(
              'Your booking request has been sent.\n'
              'Our team will contact you shortly to confirm your ride.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            // ✅ OK Button
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // close dialog
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
