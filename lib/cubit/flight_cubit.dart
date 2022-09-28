import 'package:bloc/bloc.dart';
import 'package:flutter_search/models/models.dart';
import 'package:flutter_search/repository/flights_repo.dart';
import 'package:meta/meta.dart';

part 'flight_state.dart';

class FlightCubit extends Cubit<FlightState> {
  FlightCubit() : super(FlightInitial());

  List<Flight>? flights;

  Future<List<Flight>?> getAllProfiles() async {
    var r = await FlightRepo().getAllAirport();

    return r;
  }

  void filterFlights(String query) async {
    var currentState = state;

    if (flights == null && state is FlightInitial) {
      emit(FlightLoading());
      var r = await getAllProfiles();
      if (r != null) {
        flights = r;
      } else {
        emit(FlightFailure('Terjadi Kesalahan'));
        return;
      }
    }
    List<Flight> filtered = flights!
        .where((e) =>
            e.airportName.toLowerCase().contains(query) ||
            e.locationName.toLowerCase().contains(query) ||
            e.countryName.toLowerCase().contains(query))
        .toList();
    List<FlightsByCountry> groupByCountry = [];
    filtered.forEach(
      (e) {
        var checked = checkCountry(groupByCountry, e.countryName);
        if (checked == null) {
          groupByCountry
              .add(FlightsByCountry(country: e.countryName, listFlights: [e]));
        } else {
          checked.listFlights.add(e);
        }
      },
    );
    emit(FlightLoaded(groupByCountry, message: 'Berhasil ambil data'));
  }
}

FlightsByCountry? checkCountry(List<FlightsByCountry> list, String country) {
  try {
    return list.firstWhere((e) => e.country == country);
  } catch (e) {
    return null;
  }
}
