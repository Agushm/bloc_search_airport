part of 'widgets.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightCubit, FlightState>(builder: (context, state) {
      if (state is FlightLoading || state is FlightInitial) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FlightLoaded) {
        return ListView.builder(
            itemCount: state.listFlights.length,
            itemBuilder: (context, index) {
              var data = state.listFlights[index];
              return StickyHeader(
                header: Container(
                  height: 50.0,
                  color: Colors.blueGrey[700],
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data.country,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                content: Column(
                  children: data.listFlights
                      .map((e) => ListTile(
                            title: Text(
                              e.airportName,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${e.locationName}, ${e.countryName}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ))
                      .toList(),
                ),
              );
            });
      } else {
        return Center(
          child: Text('Terjadi Kesalahan'),
        );
      }
    });
  }
}
