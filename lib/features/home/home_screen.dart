import 'package:flutter/material.dart';
import 'package:pulse_cab/features/home/sections/our_services_section/our_services_section.dart';
import 'widgets/navbar.dart';
import 'widgets/mobile_drawer.dart';
import 'sections/hero_section/hero_section.dart';
import 'sections/why_choose_us_section/why_choose_us_section.dart';
import 'sections/testimonials_section.dart';
import 'sections/stats_section.dart';
import 'sections/faq_section.dart';
import 'sections/footer_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MobileDrawer(),
      body: Column(
        children: [
          const Navbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  HeroSection(),
                  WhyChooseUsSection(),
                  OurServicesSection(),
                  TestimonialsSection(),
                  StatsSection(),
                  FAQSection(),
                  FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
