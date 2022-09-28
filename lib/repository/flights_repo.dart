import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/models.dart';

class FlightRepo {
  String url = "https://api.nuryazid.com/dummy_/station.json";

  Dio? _dio;

  FlightRepo() {
    _dio = Dio();
    _dio!.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<List<Flight>?> getAllAirport() async {
    try {
      var res = await _dio!.get(url);
      var data = json.decode(res.data);
      if (res.statusCode == 200 && data['all_flight'] != null) {
        List<Flight> load = [];
        var d = data['all_flight'] as List;

        d.forEach((e) {
          load.add(Flight.fromJson(e));
        });
        return load;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
