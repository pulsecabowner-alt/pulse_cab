import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';

class AnimatedStatCard extends StatelessWidget {
  final IconData icon;
  final int value;
  final String suffix;
  final String label;
  final bool start;
  final bool divideByTen;

  const AnimatedStatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.suffix,
    required this.label,
    required this.start,
    this.divideByTen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      padding: const EdgeInsets.symmetric(vertical: 26),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 38),
          const SizedBox(height: 18),

          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: start ? value.toDouble() : 0),
            duration: const Duration(milliseconds: 1600),
            curve: Curves.easeOutCubic,
            builder: (_, val, __) {
              final display = divideByTen
                  ? (val / 10).toStringAsFixed(1)
                  : val.toInt().toString();

              return Text(
                '$display$suffix',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            },
          ),

          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
