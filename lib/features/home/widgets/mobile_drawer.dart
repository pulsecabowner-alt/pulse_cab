import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_texts.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/features/about/about.dart';
import 'package:pulse_cab/features/contact/contact_screen.dart';
import 'package:pulse_cab/features/home/home_screen.dart';
import 'package:pulse_cab/features/privacy/privacy_policy_screen.dart';
import 'package:pulse_cab/features/terms/terms_conditions_screen.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  void _navigate(BuildContext context, Widget screen) {
    Navigator.pop(context); // close drawer
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: AppColors.primaryBlue),
              child: Text(
                AppTexts.appName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Menu Items
            _DrawerItem(
              icon: Icons.home_outlined,
              title: AppTexts.home,
              onTap: () => _navigate(context, const HomeScreen()),
            ),
            _DrawerItem(
              icon: Icons.call_outlined,
              title: AppTexts.contactUs,
              onTap: () => _navigate(context, const ContactScreen()),
            ),
            _DrawerItem(
              icon: Icons.info_outline,
              title: AppTexts.aboutUs,
              onTap: () => _navigate(context, const AboutScreen()),
            ),
            _DrawerItem(
              icon: Icons.privacy_tip_outlined,
              title: AppTexts.privacyPolicy,
              onTap: () => _navigate(context, const PrivacyPolicyScreen()),
            ),
            _DrawerItem(
              icon: Icons.description_outlined,
              title: AppTexts.terms,
              onTap: () => _navigate(context, const TermsConditionsScreen()),
            ),

            const Spacer(),

            // 🔹 Footer
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '© 2026 PulseCab',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 22),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      horizontalTitleGap: 8,
      onTap: onTap,
    );
  }
}
