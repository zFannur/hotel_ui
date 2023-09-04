part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();
}

class Empty extends BookingState {
  @override
  List<Object?> get props => [];
}

class Loading extends BookingState {
  @override
  List<Object?> get props => [];
}

class Loaded extends BookingState {
  final Booking booking;

  const Loaded({required this.booking});

  @override
  List<Object> get props => [booking];
}

class Error extends BookingState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
