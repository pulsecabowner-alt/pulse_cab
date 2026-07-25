class SearchLocationModel {
  final String title;
  final String subtitle;
  final bool isAirport;
  final String? iataCode;

  SearchLocationModel({
    required this.title,
    required this.subtitle,
    required this.isAirport,
    this.iataCode,
  });
}
