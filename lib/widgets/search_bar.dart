part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightCubit, FlightState>(
      builder: (context, state) {
        return TextFormField(
          controller: queryController,
          onChanged: (value) {},
        );
      },
    );
  }
}
