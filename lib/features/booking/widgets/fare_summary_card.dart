import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class FareSummaryCard extends StatelessWidget {
  final int totalAmount;

  const FareSummaryCard({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fare Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 16),

          _row('Base Fare', '₹$totalAmount'),
          _row('GST / Tax', 'Included'),
          _row('Toll Charges', 'Included'),
          _row('Driver Allowance', 'Included'),
          _row('Parking Charges', 'Included'),

          const Divider(height: 28),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Amount',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '₹$totalAmount',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: const [
              Icon(Icons.verified, size: 16, color: Colors.green),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'All taxes & charges are included. No hidden costs.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        blurRadius: 18,
        offset: const Offset(0, 10),
      ),
    ],
  );
}
