import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
            'Privacy Policy',
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
                'PulseCab values your privacy and is committed to protecting '
                'your personal information. This Privacy Policy explains how '
                'we collect, use, and safeguard your data when you use our services.',
              ),

              _title('Information We Collect'),
              _paragraph(
                'We may collect personal information such as your name, mobile '
                'number, pickup and drop locations, and communication details '
                'when you book a cab or contact us.',
              ),

              _title('How We Use Your Information'),
              _bullet('To provide and manage cab booking services'),
              _bullet('To contact you regarding bookings and support'),
              _bullet('To improve our services and customer experience'),

              _title('Data Security'),
              _paragraph(
                'We implement appropriate security measures to protect your '
                'personal information from unauthorized access, disclosure, '
                'or misuse.',
              ),

              _title('Sharing of Information'),
              _paragraph(
                'We do not sell or rent your personal data. Information may be '
                'shared only with drivers or partners strictly for completing '
                'your booking.',
              ),

              _title('Third-Party Services'),
              _paragraph(
                'Our website may contain links to third-party services. We are '
                'not responsible for the privacy practices of such websites.',
              ),

              _title('Your Consent'),
              _paragraph(
                'By using PulseCab services, you consent to the collection and '
                'use of information as described in this policy.',
              ),

              _title('Contact Us'),
              _paragraph(
                'If you have any questions about this Privacy Policy, please '
                'contact us via phone or WhatsApp.',
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
