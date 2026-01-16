import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/constants/app_texts.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/features/contact/contact_screen.dart';
import 'package:pulse_cab/features/home/home_screen.dart';

import 'navbar_item.dart';

class NavbarMenu extends StatelessWidget {
  const NavbarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return _mobileMenu(context);
    }

    return Row(
      children: _menuItems.map((item) {
        return NavbarItem(
          title: item.title,
          isActive: item.isActive,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: item.builder));
          },
        );
      }).toList(),
    );
  }

  Widget _mobileMenu(BuildContext context) {
    return Container(
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
    );
  }
}

// ================= MENU MODEL =================

class _MenuItem {
  final String title;
  final WidgetBuilder builder;
  final bool isActive;

  const _MenuItem({
    required this.title,
    required this.builder,
    this.isActive = false,
  });
}

const List<_MenuItem> _menuItems = [
  _MenuItem(title: AppTexts.home, builder: _homeBuilder, isActive: true),
  _MenuItem(title: AppTexts.contactUs, builder: _contactBuilder),
];
Widget _homeBuilder(BuildContext context) => const HomeScreen();

Widget _contactBuilder(BuildContext context) => const ContactScreen();
