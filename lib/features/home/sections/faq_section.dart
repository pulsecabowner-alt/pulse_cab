import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  int? _expandedIndex;

  final List<_FAQItem> _faqs = const [
    _FAQItem(
      question: 'How do I book a cab?',
      answer:
          'You can book a cab by entering your pickup location, drop location '
          'and mobile number, then click on Explore Cabs or contact us directly '
          'via call or WhatsApp.',
    ),
    _FAQItem(
      question: 'Do you provide outstation cab services?',
      answer:
          'Yes, we provide one-way, round trip and fixed route outstation cab '
          'services across multiple cities in India.',
    ),
    _FAQItem(
      question: 'Are there any hidden charges?',
      answer:
          'No, there are absolutely no hidden charges. The fare shared with you '
          'is transparent and inclusive of all standard costs.',
    ),
    _FAQItem(
      question: 'What payment options are available?',
      answer:
          'You can pay via cash, UPI, or other digital payment options directly '
          'to the driver after the ride.',
    ),
    _FAQItem(
      question: 'Is customer support available 24/7?',
      answer:
          'Yes, our customer support team is available 24/7 via call and WhatsApp '
          'to assist you with bookings and queries.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 60,
      ),
      color: AppColors.scaffoldBg,
      child: Column(
        children: [
          // 🔹 Title
          const Text(
            'Frequently Asked Questions',
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

          // 🔹 FAQ List
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: List.generate(
                _faqs.length,
                (index) => _FAQTile(
                  item: _faqs[index],
                  isExpanded: _expandedIndex == index,
                  onTap: () {
                    setState(() {
                      _expandedIndex = _expandedIndex == index ? null : index;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= FAQ TILE =================

class _FAQTile extends StatelessWidget {
  final _FAQItem item;
  final bool isExpanded;
  final VoidCallback onTap;

  const _FAQTile({
    required this.item,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.question,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
              child: Text(
                item.answer,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}

// ================= FAQ MODEL =================

class _FAQItem {
  final String question;
  final String answer;

  const _FAQItem({required this.question, required this.answer});
}
