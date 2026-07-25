import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/features/home/providers/routes_provider.dart';
import 'widgets/route_card.dart';

class PopularRoutesSection extends StatelessWidget {
  const PopularRoutesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RoutesProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const SizedBox(
            height: 250,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (provider.error != null) {
          return SizedBox(
            height: 250,
            child: Center(child: Text(provider.error!)),
          );
        }

        if (provider.routes.isEmpty) {
          return const SizedBox(
            height: 250,
            child: Center(child: Text("No routes available")),
          );
        }

        return Container(
          width: double.infinity,
          color: AppColors.scaffoldBg,
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Popular Routes',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Most booked routes with fixed pricing',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),

              const SizedBox(height: 32),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: provider.routes.map((route) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: RouteCard(route: route),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
