class AirportModel {
  final String airportName;
  final String cityName;
  final String iata;
  final String icao;

  AirportModel({
    required this.airportName,
    required this.cityName,
    required this.iata,
    required this.icao,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) {
    return AirportModel(
      airportName: json["airport_name"],
      cityName: json["city_name"],
      iata: json["IATA_code"],
      icao: json["ICAO_code"],
    );
  }
}
