part of 'models.dart';

class FlightsByCountry {
  FlightsByCountry({
    required this.country,
    required this.listFlights,
  });
  late final String country;
  late final List<Flight> listFlights;

  FlightsByCountry.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    listFlights = json['list_flights'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country'] = country;
    _data['list_flights'] = listFlights;
    return _data;
  }
}
