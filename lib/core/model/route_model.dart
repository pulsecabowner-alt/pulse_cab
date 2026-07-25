class RouteModel {
  final String id;
  final String fromLocation;
  final String toLocation;
  final List<RouteCarPrice> cars;

  const RouteModel({
    required this.id,
    required this.fromLocation,
    required this.toLocation,
    required this.cars,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json, String documentId) {
    return RouteModel(
      id: documentId,
      fromLocation: json['fromLocation'] ?? '',
      toLocation: json['toLocation'] ?? '',
      cars: (json['cars'] as List<dynamic>? ?? [])
          .map((e) => RouteCarPrice.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fromLocation': fromLocation,
      'toLocation': toLocation,
      'cars': cars.map((e) => e.toJson()).toList(),
    };
  }
}

class RouteCarPrice {
  final String carId;
  final int fixedPrice;

  const RouteCarPrice({required this.carId, required this.fixedPrice});

  factory RouteCarPrice.fromJson(Map<String, dynamic> json) {
    return RouteCarPrice(
      carId: json['carId'] ?? '',
      fixedPrice: (json['fixedPrice'] ?? 0) as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'carId': carId, 'fixedPrice': fixedPrice};
  }
}
