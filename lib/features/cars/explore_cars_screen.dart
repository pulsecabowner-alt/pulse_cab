import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pulse_cab/core/constants/app_colors.dart';
import 'package:pulse_cab/core/model/booking_request.dart';
import 'package:pulse_cab/core/model/car_model.dart';
import 'package:pulse_cab/core/model/route_car_model.dart';
import 'package:pulse_cab/core/model/route_model.dart';
import 'package:pulse_cab/core/utils/responsive.dart';
import 'package:pulse_cab/features/booking/booking_summary_screen.dart';
import 'package:pulse_cab/features/cars/provider/explore_cars_provider.dart';
import 'package:pulse_cab/features/cars/widgets/car_card.dart';

class ExploreCarsScreen extends StatelessWidget {
  final RouteModel? route;
  final BookingRequest? bookingRequest;

  const ExploreCarsScreen({super.key, this.route, this.bookingRequest})
    : assert(
        route != null || bookingRequest != null,
        'Either route or bookingRequest must be provided.',
      );

  bool get isFixTrip => route != null;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final String routeText = isFixTrip
        ? '${route!.fromLocation} → ${route!.toLocation}'
        : '${bookingRequest!.from} → ${bookingRequest!.to}';

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Select Your Cab',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) {
          final provider = ExploreCarsProvider();

          if (isFixTrip) {
            provider.loadFixedRouteCars(route!);
          } else {
            provider.loadPerKmCars();
          }

          return provider;
        },
        child: Consumer<ExploreCarsProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.error != null) {
              return Center(child: Text(provider.error!));
            }

            if (provider.cars.isEmpty) {
              return const Center(
                child: Text(
                  'No cars available',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 80,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRouteCard(routeText),

                  const SizedBox(height: 28),

                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: provider.cars.length,
                      itemBuilder: (context, index) {
                        final RouteCarModel item = provider.cars[index];

                        return CarCard(
                          car: item.car,
                          showPrice: isFixTrip,
                          fixedPrice: isFixTrip ? item.fixedPrice : null,
                          onChoose: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookingSummaryScreen(
                                  car: item.car,
                                  route: routeText,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRouteCard(String routeText) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.route, color: AppColors.primaryBlue, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  routeText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.verified, size: 14, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      isFixTrip
                          ? 'Fixed price • No hidden charges'
                          : 'Price calculated per km',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
