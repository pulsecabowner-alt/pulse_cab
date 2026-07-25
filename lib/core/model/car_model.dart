class CarModel {
  final String id;
  final String name;
  final String image;
  final String fuelType;
  final String transmission;
  final int seating;
  final String model;
  final double ratePerKm;
  final List<String> facilities;
  final List<String> exclusions;
  final String instructions;
  final String terms;
  final bool status;

  const CarModel({
    required this.id,
    required this.name,
    required this.image,
    required this.fuelType,
    required this.transmission,
    required this.seating,
    required this.model,
    required this.ratePerKm,
    required this.facilities,
    required this.exclusions,
    required this.instructions,
    required this.terms,
    required this.status,
  });

  factory CarModel.fromJson(Map<String, dynamic> json, String documentId) {
    return CarModel(
      id: documentId,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      fuelType: json['fuelType'] ?? '',
      transmission: json['transmission'] ?? '',
      seating: (json['seating'] ?? 0) as int,
      model: json['model'] ?? '',
      ratePerKm: (json['ratePerKm'] ?? 0).toDouble(),
      facilities: List<String>.from(json['facilities'] ?? []),
      exclusions: List<String>.from(json['exclusions'] ?? []),
      instructions: json['instructions'] ?? '',
      terms: json['terms'] ?? '',
      status: json['status'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'fuelType': fuelType,
      'transmission': transmission,
      'seating': seating,
      'model': model,
      'ratePerKm': ratePerKm,
      'facilities': facilities,
      'exclusions': exclusions,
      'instructions': instructions,
      'terms': terms,
      'status': status,
    };
  }
}
