part of 'flight_cubit.dart';

@immutable
abstract class FlightState {}

class FlightInitial extends FlightState {}

class FlightLoading extends FlightState {}

class FlightLoaded extends FlightState {
  final List<FlightsByCountry> listFlights;
  final String? message;
  FlightLoaded(this.listFlights, {this.message});

  @override
  String toString() {
    return 'FlightLoadedState{listFlights: $listFlights, message: $message}';
  }
}

class FlightFailure extends FlightState {
  final String? errorMessage;
  FlightFailure(this.errorMessage);
  @override
  String toString() {
    return 'FlightFailureState{errorMessage: $errorMessage}';
  }
}
