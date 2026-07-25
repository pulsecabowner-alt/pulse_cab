import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class JourneyStep extends StatelessWidget {
  final int index;
  final ValueNotifier<int> notifier;
  final IconData icon;
  final String title;
  final String description;
  final bool isLast;

  const JourneyStep({
    super.key,
    required this.index,
    required this.notifier,
    required this.icon,
    required this.title,
    required this.description,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: notifier,
      builder: (_, activeIndex, __) {
        final isActive = index == activeIndex;
        final isCompleted = index < activeIndex;

        return Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🚗 Route + Car
              Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: isActive
                        ? SizedBox(
                            key: const ValueKey('car'),
                            width: 36,
                            height: 36,
                            child: Lottie.network(
                              'https://assets10.lottiefiles.com/packages/lf20_jz2wa00k.json',
                              repeat: true,
                            ),
                          )
                        : Container(
                            key: const ValueKey('dot'),
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: isCompleted
                                  ? AppColors.primaryBlue
                                  : Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                          ),
                  ),
                  if (!isLast)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 3,
                      height: 100,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? AppColors.primaryBlue
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 24),

              // 📦 Card
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(bottom: 36),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: isActive
                            ? AppColors.primaryBlue.withOpacity(0.18)
                            : Colors.black.withOpacity(0.04),
                        blurRadius: 25,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(icon, size: 32, color: AppColors.primaryBlue),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              description,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
