import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/model/car_model.dart';
import 'package:pulse_cab/features/booking/widgets/fare_summary_card.dart';
import 'package:pulse_cab/features/booking/widgets/section_title.dart';
import 'package:pulse_cab/features/booking/widgets/summary_card.dart';
import 'package:pulse_cab/features/cars/explore_cars_screen.dart';

class BookingSummaryScreen extends StatelessWidget {
  final CarModel car;
  final String route;

  const BookingSummaryScreen({
    super.key,
    required this.car,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Booking Summary',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CarSummaryCard(car: car),
            const SizedBox(height: 20),
            RideSummaryCard(route: route, price: 1200),
            const SizedBox(height: 20),
            FareSummaryCard(totalAmount: 1200),
            const SizedBox(height: 20),
            UserDetailsForm(),
            const SizedBox(height: 30),
            BookNowButton(),
          ],
        ),
      ),
    );
  }
}
