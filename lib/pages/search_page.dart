import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_search/widgets/widgets.dart';

import '../cubit/flight_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late FlightCubit flightCubit;
  @override
  void initState() {
    flightCubit = FlightCubit();
    flightCubit.filterFlights('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchBar(),
        ),
        body: SearchResult());
  }
}
