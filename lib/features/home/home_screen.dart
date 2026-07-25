import 'package:flutter/material.dart';
import 'package:pulse_cab/features/home/sections/booking_cta_section/booking_cta_section.dart';
import 'package:pulse_cab/features/home/sections/our_services_section/our_services_section.dart';
import 'package:pulse_cab/features/home/sections/popular_routes_section/popular_routes_section.dart';
import 'widgets/navbar.dart';
import 'widgets/mobile_drawer.dart';
import 'sections/hero_section/hero_section.dart';
import 'sections/why_choose_us_section/why_choose_us_section.dart';
import 'sections/testimonials_section.dart';
import 'sections/stats_section/stats_section.dart';
import 'sections/faq_section.dart';
import 'sections/footer_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MobileDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            elevation: 2,
            backgroundColor: Colors.white,
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            flexibleSpace: const Navbar(),
          ),
          const SliverToBoxAdapter(child: HeroSection()),
          const SliverToBoxAdapter(child: PopularRoutesSection()),
          const SliverToBoxAdapter(child: WhyChooseUsSection()),
          const SliverToBoxAdapter(child: OurServicesSection()),
          const SliverToBoxAdapter(child: BookingCTASection()),
          const SliverToBoxAdapter(child: TestimonialsSection()),
          const SliverToBoxAdapter(child: StatsSection()),
          const SliverToBoxAdapter(child: FAQSection()),
          const SliverToBoxAdapter(child: FooterSection()),
        ],
      ),
    );
  }
}
