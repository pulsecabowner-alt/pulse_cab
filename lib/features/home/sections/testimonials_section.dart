import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 60,
      ),
      color: Colors.white,
      child: Column(
        children: [
          // 🔹 Title
          const Text(
            'What Our Customers Say',
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

          // 🔹 Testimonials list
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 40),
              itemCount: _testimonials.length,
              separatorBuilder: (_, __) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                return _TestimonialCard(testimonial: _testimonials[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ================= CARD =================

class _TestimonialCard extends StatelessWidget {
  final _Testimonial testimonial;

  const _TestimonialCard({required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ⭐ Rating
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < testimonial.rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 18,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Review text
          Text(
            testimonial.review,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),

          const Spacer(),

          // Name & city
          Text(
            testimonial.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            testimonial.city,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= MODEL & DATA =================

class _Testimonial {
  final String name;
  final String city;
  final String review;
  final int rating;

  const _Testimonial({
    required this.name,
    required this.city,
    required this.review,
    required this.rating,
  });
}

const List<_Testimonial> _testimonials = [
  _Testimonial(
    name: 'Rahul Sharma',
    city: 'Ahmedabad',
    review:
        'Great service! The car was clean and the driver was very polite. '
        'Booking process was smooth and hassle free.',
    rating: 5,
  ),
  _Testimonial(
    name: 'Priya Patel',
    city: 'Vadodara',
    review:
        'Very reliable cab service. Pricing was transparent and no hidden '
        'charges. Highly recommended!',
    rating: 5,
  ),
  _Testimonial(
    name: 'Amit Verma',
    city: 'Surat',
    review:
        'Comfortable ride and excellent support team. Will definitely use '
        'again for my outstation trips.',
    rating: 4,
  ),
];
    