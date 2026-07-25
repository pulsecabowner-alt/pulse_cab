import 'dart:convert';
import 'package:flutter/services.dart';

class AssetService {
  Future<Map<String, dynamic>> loadCities() async {
    final jsonString = await rootBundle.loadString("assets/city/cities.json");

    return json.decode(jsonString);
  }

  Future<Map<String, dynamic>> loadAirports() async {
    final jsonString = await rootBundle.loadString(
      "assets/airport/airports.json",
    );

    return json.decode(jsonString);
  }
}
