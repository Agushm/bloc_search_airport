import 'package:flutter_search/repository/flights_repo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  var res = await FlightRepo().getAllAirport();
  print(res![0]);
}
