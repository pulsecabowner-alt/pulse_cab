import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [_heroSection(isMobile), _contentSection(isMobile)],
        ),
      ),
    );
  }

  // ================= HERO =================

  Widget _heroSection(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
        ),
      ),
      child: Column(
        children: const [
          Text(
            'About PulseCab',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: 600,
            child: Text(
              'Your trusted partner for comfortable, reliable and affordable cab services across India.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  // ================= CONTENT =================

  Widget _contentSection(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 70,
      ),
      color: AppColors.scaffoldBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Who We Are'),
          const SizedBox(height: 16),
          _paragraph(
            'PulseCab was founded with a simple mission — to make travel easy, '
            'safe, and affordable for everyone. We specialize in outstation, '
            'one-way, round-trip and local cab services across multiple cities.',
          ),

          const SizedBox(height: 40),

          _sectionTitle('Why Choose PulseCab'),
          const SizedBox(height: 24),

          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: const [
              _FeatureCard(
                icon: Icons.verified,
                title: 'Trusted Service',
                desc:
                    'Thousands of happy customers rely on PulseCab for their daily and outstation travel.',
              ),
              _FeatureCard(
                icon: Icons.directions_car,
                title: 'Clean & Comfortable Cars',
                desc:
                    'Our vehicles are regularly cleaned and maintained for a smooth ride.',
              ),
              _FeatureCard(
                icon: Icons.support_agent,
                title: '24/7 Support',
                desc:
                    'We are always available via call or WhatsApp to help you anytime.',
              ),
            ],
          ),

          const SizedBox(height: 50),

          _sectionTitle('Our Promise'),
          const SizedBox(height: 16),
          _paragraph(
            'At PulseCab, we promise transparent pricing, professional drivers, '
            'and a hassle-free booking experience every single time.',
          ),
        ],
      ),
    );
  }

  // ================= SMALL WIDGETS =================

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
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
}

// ================= FEATURE CARD =================

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 32),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
