import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pulse_cab/core/routes/app_routes.dart';
import 'package:pulse_cab/core/theme/app_theme.dart';
import 'package:pulse_cab/features/home/home_screen.dart';
import 'package:pulse_cab/features/home/providers/location_provider.dart';
import 'package:pulse_cab/features/home/providers/routes_provider.dart';
import 'package:pulse_cab/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final locationProvider = LocationProvider();
  await locationProvider.loadData();

  final routesProvider = RoutesProvider();
  await routesProvider.loadRoutes();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: locationProvider),
        ChangeNotifierProvider.value(value: routesProvider),
      ],
      child: const MyApp(),
    ),
  );
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
