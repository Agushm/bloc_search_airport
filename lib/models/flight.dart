part of 'models.dart';

class Flight {
  Flight({
    required this.airportName,
    required this.businessId,
    required this.airportCode,
    required this.businessNameTransId,
    required this.locationName,
    required this.countryId,
    required this.countryName,
    required this.label,
  });
  late final String airportName;
  late final String businessId;
  late final String airportCode;
  late final String businessNameTransId;
  late final String locationName;
  late final String countryId;
  late final String countryName;
  late final String label;

  Flight.fromJson(Map<String, dynamic> json) {
    airportName = json['airport_name'];
    businessId = json['business_id'];
    airportCode = json['airport_code'];
    businessNameTransId = json['business_name_trans_id'];
    locationName = json['location_name'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['airport_name'] = airportName;
    _data['business_id'] = businessId;
    _data['airport_code'] = airportCode;
    _data['business_name_trans_id'] = businessNameTransId;
    _data['location_name'] = locationName;
    _data['country_id'] = countryId;
    _data['country_name'] = countryName;
    _data['label'] = label;
    return _data;
  }
}
