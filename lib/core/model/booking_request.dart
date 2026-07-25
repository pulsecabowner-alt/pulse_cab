class BookingRequest {
  final String from;
  final String to;
  final String mobile;
  final bool isFixTrip;

  const BookingRequest({
    required this.from,
    required this.to,
    required this.mobile,
    required this.isFixTrip,
  });

  String get route => '$from → $to';
}
