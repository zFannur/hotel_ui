import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_test/entity/hotel.dart';
import 'package:job_test/repository/repository.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  Repository repository = Repository();

  HotelBloc() : super(Empty()) {
    on<GetHotelEvent>((event, emit) async {
      emit(Loading());
      final Hotel hotel;

      try {
        hotel = await repository.getHotel();
        emit(Loaded(hotel: hotel));
      } catch(e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
