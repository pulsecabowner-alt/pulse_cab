import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/model/car_model.dart';

class CarCard extends StatelessWidget {
  final CarModel car;
  final bool showPrice;
  final int? fixedPrice;
  final VoidCallback onChoose;

  const CarCard({
    super.key,
    required this.car,
    required this.showPrice,
    this.fixedPrice,
    required this.onChoose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
            child: Image.network(
              car.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('IMAGE ERROR: $error');

                return Container(
                  height: 180,
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: const Icon(Icons.image_not_supported, size: 50),
                );
              },
            ),
          ),

          /// Content
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [
                    _FeatureIcon(
                      icon: Icons.event_seat,
                      label: '${car.seating} Seater',
                    ),
                    const SizedBox(width: 18),
                    _FeatureIcon(icon: Icons.settings, label: car.transmission),
                    const SizedBox(width: 18),
                    _FeatureIcon(
                      icon: Icons.local_gas_station,
                      label: car.fuelType,
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (showPrice)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fixed Price',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '₹${fixedPrice ?? 0}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Starting From',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '₹${car.ratePerKm}/km',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      ),

                    _PrimaryButton(title: 'Select Cab', onTap: onChoose),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: AppColors.primaryBlue),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _PrimaryButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryBlue, Color(0xFF1E88E5)],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryBlue.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
