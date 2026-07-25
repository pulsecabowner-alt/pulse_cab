import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/model/car_model.dart';

class CarSummaryCard extends StatelessWidget {
  final CarModel car;
  const CarSummaryCard({required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              car.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  car.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '₹${car.ratePerKm}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
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
