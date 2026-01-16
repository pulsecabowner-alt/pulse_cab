import 'package:flutter/material.dart';
import 'package:pulse_cab/core/routes/app_routes.dart';
import 'package:pulse_cab/features/contact/contact_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PulseCab',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
