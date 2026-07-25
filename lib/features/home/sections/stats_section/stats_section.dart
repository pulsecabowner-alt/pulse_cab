import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/features/home/sections/stats_section/animated_stat_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class StatsSection extends StatefulWidget {
  const StatsSection({super.key});

  @override
  State<StatsSection> createState() => _StatsSectionState();
}

class _StatsSectionState extends State<StatsSection> {
  bool _startCounting = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return VisibilityDetector(
      key: const Key('stats-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.4 && !_startCounting) {
          setState(() => _startCounting = true);
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 80,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Our Journey in Numbers',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),

            Container(
              height: 3,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: 50),

            Wrap(
              spacing: 40,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: [
                AnimatedStatCard(
                  icon: Icons.directions_car,
                  value: 5000,
                  suffix: '+',
                  label: 'Rides Completed',
                  start: _startCounting,
                ),
                AnimatedStatCard(
                  icon: Icons.location_city,
                  value: 100,
                  suffix: '+',
                  label: 'Cities Covered',
                  start: _startCounting,
                ),
                AnimatedStatCard(
                  icon: Icons.people,
                  value: 4500,
                  suffix: '+',
                  label: 'Happy Customers',
                  start: _startCounting,
                ),
                AnimatedStatCard(
                  icon: Icons.star,
                  value: 48,
                  suffix: '/5',
                  label: 'Average Rating',
                  start: _startCounting,
                  divideByTen: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
