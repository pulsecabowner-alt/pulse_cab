import 'package:flutter/material.dart';
import 'package:pulse_cab/features/home/home_screen.dart';
import 'package:pulse_cab/features/contact/contact_screen.dart';

class AppRoutes {
  // Route names
  static const String splash = '/';
  static const String home = '/home';
  static const String contact = '/contact';

  // Route map
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    contact: (context) => const ContactScreen(),
  };
}
