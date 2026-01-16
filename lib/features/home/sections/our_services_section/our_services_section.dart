import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/constants/app_texts.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/core/widgets/app_text.dart';

import 'widgets/service_card.dart';

class OurServicesSection extends StatelessWidget {
  const OurServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      color: AppColors.scaffoldBg,
      child: Column(
        children: [
          AppText(
            AppTexts.ourServices,
            size: 68,
            weight: FontWeight.bold,
            color: AppColors.textPrimary,
            align: TextAlign.center,
          ),

          Responsive.vSpace(context, 8),

          Container(
            height: 3,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Responsive.vSpace(context, 40),

          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 2;
              if (constraints.maxWidth >= 900) {
                crossAxisCount = 3;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: Responsive.scale(
                    context,
                    260,
                    min: 230,
                    max: 300,
                  ),
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final services = [
                    const ServiceCard(
                      icon: Icons.sync,
                      title: 'Roundtrip Cabs',
                      description:
                          'Perfect for outstation trips with return flexibility.',
                    ),
                    const ServiceCard(
                      icon: Icons.trending_flat,
                      title: 'One Way Drops',
                      description:
                          'Pay only for the distance you travel. Ideal for intercity trips.',
                    ),
                    const ServiceCard(
                      icon: Icons.access_time,
                      title: 'Local Rentals',
                      description:
                          'Hourly rental packages for meetings and errands.',
                    ),
                    const ServiceCard(
                      icon: Icons.flight_takeoff,
                      title: 'Airport Transfers',
                      description:
                          'Reliable airport pickups and drops across major cities.',
                    ),
                  ];

                  return services[index];
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
