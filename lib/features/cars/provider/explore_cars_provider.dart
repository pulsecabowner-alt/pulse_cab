import 'package:flutter/material.dart';
import 'package:pulse_cab/core/model/car_model.dart';
import 'package:pulse_cab/core/model/route_car_model.dart';
import 'package:pulse_cab/core/model/route_model.dart';
import 'package:pulse_cab/core/repositories/route_repository.dart';

class ExploreCarsProvider extends ChangeNotifier {
  final RouteRepository _repository = RouteRepository();

  bool isLoading = false;
  String? error;

  List<RouteCarModel> cars = [];

  Future<void> loadFixedRouteCars(RouteModel route) async {
    print('========== ROUTE ==========');
    print(route.id);
    print(route.fromLocation);
    print(route.toLocation);
    print(route.cars.length);

    final List<RouteCarModel> result = [];

    for (final item in route.cars) {
      print('Car Id : ${item.carId}');

      final car = await _repository.getCar(item.carId);

      print('Loaded Car : ${car?.name}');

      if (car != null) {
        result.add(RouteCarModel(car: car, fixedPrice: item.fixedPrice));
      }
    }

    print('Result Count : ${result.length}');

    cars = result;
    notifyListeners();
  }

  Future<void> loadPerKmCars() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      final List<CarModel> allCars = await _repository.getCars();

      cars = allCars
          .map((car) => RouteCarModel(car: car, fixedPrice: 0))
          .toList();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
