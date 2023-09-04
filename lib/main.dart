import 'package:flutter/material.dart';
import 'package:job_test/presentation/bloc/booking_bloc/booking_bloc.dart';
import 'package:job_test/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:job_test/presentation/bloc/rooms_bloc/rooms_bloc.dart';
import 'package:job_test/presentation/pages/hotel_page.dart';
import 'package:job_test/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HotelBloc()..add(GetHotelEvent()),
        ),
        BlocProvider(
          create: (context) => RoomsBloc()..add(GetRoomsEvent()),
        ),
        BlocProvider(
          create: (context) => BookingBloc()..add(GetBookingEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HotelPage(),
      ),
    );
  }
}