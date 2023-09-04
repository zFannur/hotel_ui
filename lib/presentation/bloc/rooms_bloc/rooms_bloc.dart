import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_test/entity/rooms.dart';

import 'package:job_test/repository/repository.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  Repository repository = Repository();

  RoomsBloc() : super(Empty()) {
    on<RoomsEvent>((event, emit) async {
      emit(Loading());
      Rooms rooms;

      try {
        rooms = await repository.getRooms();
        emit(Loaded(rooms: rooms));
      } catch(e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
