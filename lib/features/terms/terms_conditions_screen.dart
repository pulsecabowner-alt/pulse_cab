import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [_header(isMobile), _content(isMobile)]),
      ),
    );
  }

  // ================= HEADER =================

  Widget _header(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 90,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
        ),
      ),
      child: Column(
        children: const [
          Text(
            'Terms & Conditions',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Last updated: January 2026',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // ================= CONTENT =================

  Widget _content(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 60,
      ),
      color: AppColors.scaffoldBg,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title('Introduction'),
              _paragraph(
                'These Terms & Conditions govern your use of PulseCab services. '
                'By accessing or using our services, you agree to be bound by '
                'these terms.',
              ),

              _title('Services'),
              _paragraph(
                'PulseCab provides cab booking services including one-way, '
                'round-trip, local, and outstation travel. Service availability '
                'may vary based on location and time.',
              ),

              _title('Booking & Confirmation'),
              _paragraph(
                'All bookings are subject to availability. A booking is '
                'confirmed only after it is accepted by PulseCab or its '
                'authorized driver partner.',
              ),

              _title('Pricing & Payment'),
              _bullet('Prices are communicated before trip confirmation'),
              _bullet('No hidden charges unless informed explicitly'),
              _bullet('Payment can be made via cash or digital modes'),

              _title('Cancellations & Refunds'),
              _paragraph(
                'Cancellation policies may vary depending on the trip type. '
                'Any applicable cancellation charges will be communicated '
                'at the time of booking.',
              ),

              _title('User Responsibilities'),
              _bullet('Provide accurate pickup and drop details'),
              _bullet('Ensure timely availability at pickup location'),
              _bullet('Maintain respectful behavior with drivers'),

              _title('Limitation of Liability'),
              _paragraph(
                'PulseCab shall not be liable for delays, losses, or damages '
                'caused due to factors beyond reasonable control including '
                'traffic, weather, or third-party actions.',
              ),

              _title('Changes to Terms'),
              _paragraph(
                'PulseCab reserves the right to modify these Terms & Conditions '
                'at any time. Updated terms will be effective upon posting.',
              ),

              _title('Contact Information'),
              _paragraph(
                'For any questions regarding these Terms & Conditions, please '
                'contact our support team via phone or WhatsApp.',
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ================= SMALL WIDGETS =================

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _paragraph(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        height: 1.7,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  '),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
