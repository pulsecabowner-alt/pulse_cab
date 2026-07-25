import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_texts.dart';
import 'package:pulse_cab/core/model/booking_request.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/features/cars/explore_cars_screen.dart';
import 'package:pulse_cab/features/home/sections/hero_section/widgets/city_input.dart';
import 'package:pulse_cab/features/home/sections/hero_section/widgets/mobile_number_field.dart';

import '../../../widgets/input_field.dart';
import 'swap_button.dart';
import 'trip_type_toggle.dart';

class BookingCard extends StatefulWidget {
  const BookingCard({super.key});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final mobileController = TextEditingController();

  String? fromError;
  String? toError;
  String? mobileError;

  void swapLocations() {
    final temp = fromController.text;
    fromController.text = toController.text;
    toController.text = temp;

    setState(() {
      fromError = null;
      toError = null;
    });
  }

  bool _validateForm() {
    setState(() {
      fromError = null;
      toError = null;
      mobileError = null;
    });

    bool valid = true;

    final from = fromController.text.trim();
    final to = toController.text.trim();
    final mobile = mobileController.text.trim();

    if (from.isEmpty) {
      fromError = 'Please select from location';
      valid = false;
    }

    if (to.isEmpty) {
      toError = 'Please select to location';
      valid = false;
    }

    if (from.isNotEmpty && to.isNotEmpty && from == to) {
      toError = 'From and To location cannot be same';
      valid = false;
    }

    if (mobile.isEmpty) {
      mobileError = 'Please enter mobile number';
      valid = false;
    } else if (mobile.length != 10) {
      mobileError = 'Enter valid 10 digit mobile number';
      valid = false;
    }

    return valid;
  }

  BookingRequest _buildRequest() {
    return BookingRequest(
      from: fromController.text.trim(),
      to: toController.text.trim(),
      mobile: mobileController.text.trim(),
      isFixTrip: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 30,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          const TripTypeToggle(),
          const SizedBox(height: 24),

          isMobile ? _mobileLayout() : _desktopLayout(),

          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (!_validateForm()) return;

                final request = _buildRequest();

                _navigate(context, ExploreCarsScreen(bookingRequest: request));
              },
              child: const Text(AppTexts.exploreCabs),
            ),
          ),
        ],
      ),
    );
  }

  // ================= DESKTOP =================
  void _navigate(BuildContext context, Widget screen) {
    Navigator.pop(context); // close drawer
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  Widget _desktopLayout() {
    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              InputField(
                label: AppTexts.fromLocation,
                controller: fromController,
                errorText: fromError,
              ),
              SwapButton(onTap: swapLocations),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InputField(
            label: AppTexts.toLocation,
            controller: toController,

            errorText: toError,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InputField(
            label: AppTexts.mobileNumber,
            controller: mobileController,
            keyboardType: TextInputType.phone,
            errorText: mobileError,
          ),
        ),
      ],
    );
  }

  // ================= MOBILE =================

  Widget _mobileLayout() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            CityInput(
              label: AppTexts.fromLocation,
              controller: fromController,
              errorText: fromError,
            ),
            SwapButton(onTap: swapLocations),
          ],
        ),
        const SizedBox(height: 16),
        CityInput(
          label: AppTexts.toLocation,
          controller: toController,
          errorText: toError,
        ),
        const SizedBox(height: 16),
        MobileNumberField(controller: mobileController, errorText: mobileError),
      ],
    );
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    mobileController.dispose();
    super.dispose();
  }
}
