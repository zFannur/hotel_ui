part of 'hotel_bloc.dart';

abstract class HotelState extends Equatable {
  const HotelState();
}

class Empty extends HotelState {
  @override
  List<Object?> get props => [];
}

class Loading extends HotelState {
  @override
  List<Object?> get props => [];
}

class Loaded extends HotelState {
  final Hotel hotel;

  const Loaded({required this.hotel});

  @override
  List<Object> get props => [hotel];
}

class Error extends HotelState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
