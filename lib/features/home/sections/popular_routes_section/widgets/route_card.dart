import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/model/route_model.dart';
import 'package:pulse_cab/features/cars/explore_cars_screen.dart';

class RouteCard extends StatelessWidget {
  final RouteModel route;

  const RouteCard({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    final startingPrice = route.cars.isNotEmpty
        ? route.cars.first.fixedPrice
        : 0;

    return Container(
      width: 260,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 18,
                color: AppColors.primaryBlue,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '${route.fromLocation} → ${route.toLocation}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Starting from',
            style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 6),
          Text(
            '₹$startingPrice',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExploreCarsScreen(route: route),
                  ),
                );
              },
              child: const Text('Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}
