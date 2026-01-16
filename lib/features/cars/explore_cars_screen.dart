import 'package:flutter/material.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/features/cars/widgets/car_card.dart';

class ExploreCarsScreen extends StatelessWidget {
  final String route;
  final bool isFixTrip;

  const ExploreCarsScreen({
    super.key,
    required this.route,
    this.isFixTrip = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    const List<CarModel> cars = [
      CarModel(
        name: 'Swift Dzire',
        fuel: 'CNG',
        price: 4200,
        image: 'https://images.unsplash.com/photo-1617531653332-bd46c24f2068',
      ),
      CarModel(
        name: 'Ertiga',
        fuel: 'Diesel',
        price: 5800,
        image: 'https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2',
      ),
      CarModel(
        name: 'Innova Crysta',
        fuel: 'Diesel',
        price: 7500,
        image: 'https://images.unsplash.com/photo-1597008641621-6c01c3b0a4e2',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Cab'),
        backgroundColor: AppColors.primaryBlue,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 80,
          vertical: 24,
        ),
        color: AppColors.scaffoldBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Route
            Text(
              route,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Fixed price • No hidden charges',
              style: TextStyle(color: AppColors.textSecondary),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final car = cars[index];
                  return CarCard(
                    car: car,
                    showPrice: isFixTrip,
                    onChoose: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => ChooseCarScreen(car: car),
                      //   ),
                      // );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarModel {
  final String name;
  final String fuel;
  final int price;
  final String image;

  const CarModel({
    required this.name,
    required this.fuel,
    required this.price,
    required this.image,
  });
}
