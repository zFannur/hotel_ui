import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_test/entity/booking.dart';
import 'package:job_test/repository/repository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  Repository repository = Repository();

  BookingBloc() : super(Empty()) {
    on<GetBookingEvent>((event, emit) async {
      emit(Loading());
      final Booking booking;

      try {
        booking = await repository.getBooking();
        emit(Loaded(booking: booking));
      } catch(e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
