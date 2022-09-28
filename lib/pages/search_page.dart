import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<FlightCubit>().filterFlights('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(20, 50, 20, 0), child: SearchBar()),
        Expanded(child: SearchResult()),
      ],
    ));
  }
}
