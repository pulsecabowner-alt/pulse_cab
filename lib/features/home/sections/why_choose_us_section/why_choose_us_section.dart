import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_texts.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/features/home/sections/why_choose_us_section/widgets/why_choose_card.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      color: Colors.white,
      child: Column(
        children: [
          // 🔹 Title
          const Text(
            AppTexts.whyChooseUs,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),

          // underline
          Container(
            height: 3,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 40),

          // 🔹 Cards
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;

              int crossAxisCount = 2;
              if (width >= 900) {
                crossAxisCount = 3;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 240,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  final items = [
                    const WhyChooseCard(
                      icon: Icons.cleaning_services,
                      title: 'Clean & Hygienic Cars',
                      description:
                          'Each car is thoroughly cleaned and sanitized before every trip.',
                    ),
                    const WhyChooseCard(
                      icon: Icons.receipt_long,
                      title: 'Transparent Billing',
                      description:
                          'No hidden charges. Get upfront pricing every time you book.',
                    ),
                    const WhyChooseCard(
                      icon: Icons.person,
                      title: 'Expert Chauffeurs',
                      description:
                          'Professionally trained drivers ensuring safe and smooth rides.',
                    ),
                  ];

                  return items[index];
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
