part of 'hotel_bloc.dart';

abstract class HotelEvent extends Equatable {
  const HotelEvent();
}

class GetHotelEvent extends HotelEvent {
  @override
  List<Object?> get props => [];
}