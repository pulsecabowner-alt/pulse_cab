import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/constants/app_texts.dart';
import 'package:pulse_cab/core/utils/responsive.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔹 Brand
          Row(
            children: const [
              Icon(
                Icons.directions_car_filled,
                color: AppColors.primaryBlue,
                size: 28,
              ),
              SizedBox(width: 10),
              Text(
                AppTexts.appName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          // 🔹 Menu
          Responsive.isMobile(context)
              ? Builder(
                  builder: (context) {
                    return Row(
                      children: [
                        // 📞 Call Button
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.call,
                              color: AppColors.primaryBlue,
                            ),
                            onPressed: () async {
                              final uri = Uri.parse('tel:+919999999999');
                              // ignore: deprecated_member_use
                              // await launchUrl(uri);
                            },
                          ),
                        ),

                        // ☰ Menu Button
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.scaffoldBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Row(
                  children: const [
                    _NavItem(title: AppTexts.home),
                    _NavItem(title: AppTexts.contactUs),
                    _NavItem(title: AppTexts.aboutUs),
                    _NavItem(title: AppTexts.privacyPolicy),
                    _NavItem(title: AppTexts.terms),
                  ],
                ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  const _NavItem({required this.title});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 180),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: _hover ? AppColors.primaryBlue : AppColors.textSecondary,
              ),
              child: Text(widget.title),
            ),
            const SizedBox(height: 6),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              height: 2,
              width: _hover ? 24 : 0,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
