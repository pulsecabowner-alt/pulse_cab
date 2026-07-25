import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/core/widgets/app_text.dart';
import 'widgets/booking_card.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  static const double navbarHeight = 80;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight - navbarHeight,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 20 : 80,
          vertical: Responsive.isMobile(context) ? 40 : 80,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
            ),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            AppText(
              'Services Across 100+ Cities',
              size: 78,
              weight: FontWeight.w600,
              color: AppColors.white,
              align: TextAlign.center,
            ),
            SizedBox(height: 24),
            BookingCard(),
            SizedBox(height: 24),
            AppText(
              'India’s Top Rated Car Rental Service',
              size: 14,
              color: Colors.white70,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
