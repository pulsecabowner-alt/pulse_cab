import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/features/booking/widgets/booking_success_dialog.dart';
import 'package:pulse_cab/features/home/sections/hero_section/widgets/mobile_number_field.dart';

class RideSummaryCard extends StatelessWidget {
  final String route;
  final int price;

  const RideSummaryCard({required this.route, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ride Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          _row(Icons.route, route),
          _row(Icons.payments, 'Fixed Price: ₹$price'),
          _row(Icons.verified, 'No hidden charges'),
        ],
      ),
    );
  }

  Widget _row(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primaryBlue),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

BoxDecoration _cardDecoration() {
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

InputDecoration _inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    filled: true,
    fillColor: AppColors.scaffoldBg,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  );
}

class BookNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const BookingSuccessDialog(),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Book Now',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class UserDetailsForm extends StatelessWidget {
  final pickupController = TextEditingController();
  final dropController = TextEditingController();
  final noteController = TextEditingController();
  final mobileController = TextEditingController();

  UserDetailsForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),

          _textField('Pickup Location', pickupController),
          const SizedBox(height: 12),

          _textField('Drop Location', dropController),
          const SizedBox(height: 12),

          MobileNumberField(controller: mobileController),
          const SizedBox(height: 12),

          TextField(
            controller: noteController,
            maxLines: 3,
            decoration: _inputDecoration('Note (optional)'),
          ),
        ],
      ),
    );
  }

  Widget _textField(String label, TextEditingController c) {
    return TextField(controller: c, decoration: _inputDecoration(label));
  }
}
