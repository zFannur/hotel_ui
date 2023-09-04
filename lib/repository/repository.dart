import 'package:dio/dio.dart';
import 'package:job_test/entity/booking.dart';
import 'package:job_test/entity/rooms.dart';
import 'package:job_test/entity/hotel.dart';
import 'network/api/constant/endpoints.dart';
import 'network/dio_exception.dart';

class Repository {
  final Dio _dio = Dio();

  Repository() {
    // _dio
    // //..options.baseUrl = Endpoints.baseUrl
    //   ..options.connectTimeout = Endpoints.connectionTimeout
    //   ..options.receiveTimeout = Endpoints.receiveTimeout
    //   ..options.responseType = ResponseType.json
    //   ..interceptors.add(LogInterceptor(
    //     request: true,
    //     requestHeader: true,
    //     requestBody: true,
    //     responseHeader: true,
    //     responseBody: true,
    //   ));
  }

  Future<Hotel> getHotel() async {
    try {
      final response = await _dio.get(Endpoints.hotelUrl);
      final hotel = Hotel.fromJson(response.data);
      return hotel;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Rooms> getRooms() async {
    try {
      final response = await _dio.get(Endpoints.roomsUrl);
      final rooms = Rooms.fromJson(response.data);
      return rooms;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Booking> getBooking() async {
    try {
      final response = await _dio.get(Endpoints.bookingUrl);
      final booking = Booking.fromJson(response.data);
      return booking;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
