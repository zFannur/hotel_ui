part of 'rooms_bloc.dart';

abstract class RoomsState extends Equatable {
  const RoomsState();
}

class Empty extends RoomsState {
  @override
  List<Object?> get props => [];
}

class Loading extends RoomsState {
  @override
  List<Object?> get props => [];
}

class Loaded extends RoomsState {
  final Rooms rooms;

  const Loaded({required this.rooms});

  @override
  List<Object> get props => [rooms];
}

class Error extends RoomsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
