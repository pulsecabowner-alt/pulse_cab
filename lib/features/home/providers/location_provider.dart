import 'package:flutter/material.dart';
import 'package:pulse_cab/core/model/airport_model.dart';
import 'package:pulse_cab/core/model/city_model.dart';
import 'package:pulse_cab/core/services/asset_service.dart';

class LocationProvider extends ChangeNotifier {
  final AssetService _service = AssetService();

  List<CityModel> cities = [];
  List<AirportModel> airports = [];

  Future<void> loadData() async {
    cities.clear();
    airports.clear();

    final cityJson = await _service.loadCities();

    cityJson.forEach((state, cityList) {
      for (final city in cityList) {
        cities.add(CityModel(city: city, state: state));
      }
    });

    final airportJson = await _service.loadAirports();

    airports = (airportJson["airports"] as List)
        .map((e) => AirportModel.fromJson(e))
        .toList();

    notifyListeners();
  }
}
