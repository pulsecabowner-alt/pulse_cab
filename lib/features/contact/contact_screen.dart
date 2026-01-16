import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/features/home/widgets/mobile_drawer.dart';
import 'widgets/contact_form.dart';
import 'widgets/contact_info.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      drawer: const MobileDrawer(),
      body: Column(
        children: [
          // Optional: Navbar
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 80,
                  vertical: 60,
                ),
                color: AppColors.scaffoldBg,
                child: Column(
                  children: [
                    const Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'We are here to help you with bookings and queries',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 50),

                    isMobile
                        ? const Column(
                            children: [
                              ContactForm(),
                              SizedBox(height: 40),
                              ContactInfo(),
                            ],
                          )
                        : const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: ContactForm()),
                              SizedBox(width: 60),
                              Expanded(child: ContactInfo()),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
