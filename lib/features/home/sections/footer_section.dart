import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/constants/app_texts.dart';
import 'package:pulse_cab/core/utils/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      color: AppColors.textPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMobile ? _mobileFooter() : _desktopFooter(),
          const SizedBox(height: 32),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),

          // 🔹 Copyright
          Center(
            child: Text(
              '© ${DateTime.now().year} ${AppTexts.appName}. All rights reserved.',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  // ================= DESKTOP =================

  Widget _desktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand
        Expanded(flex: 2, child: _brandSection()),

        // Quick Links
        Expanded(child: _linksSection()),

        // Contact
        Expanded(child: _contactSection()),
      ],
    );
  }

  // ================= MOBILE =================

  Widget _mobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _brandSection(),
        const SizedBox(height: 24),
        _linksSection(),
        const SizedBox(height: 24),
        _contactSection(),
      ],
    );
  }

  // ================= SECTIONS =================

  Widget _brandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          AppTexts.appName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Reliable outstation and local cab services across India. '
          'Safe, comfortable and affordable rides every time.',
          style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  Widget _linksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Quick Links',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        _FooterLink(title: AppTexts.home),
        _FooterLink(title: AppTexts.aboutUs),
        _FooterLink(title: AppTexts.contactUs),
        _FooterLink(title: AppTexts.privacyPolicy),
        _FooterLink(title: AppTexts.terms),
      ],
    );
  }

  Widget _contactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Contact',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        _FooterContact(icon: Icons.call, text: '+91 99999 99999'),
        SizedBox(height: 8),
        _FooterContact(icon: Icons.message, text: 'WhatsApp Support'),
      ],
    );
  }
}

// ================= SMALL WIDGETS =================

class _FooterLink extends StatelessWidget {
  final String title;
  const _FooterLink({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          // TODO: navigation / scroll
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ),
    );
  }
}

class _FooterContact extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FooterContact({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }
}
