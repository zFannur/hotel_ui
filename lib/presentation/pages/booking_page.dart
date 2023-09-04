import 'package:flutter/material.dart';
import 'package:job_test/entity/booking.dart';
import 'package:job_test/presentation/bloc/booking_bloc/booking_bloc.dart';
import 'package:job_test/presentation/pages/paid_page.dart';
import 'package:job_test/presentation/widgets/about_booking_widget.dart';
import 'package:job_test/presentation/widgets/about_buyer_widget.dart';
import 'package:job_test/presentation/widgets/navigation_panel_widget.dart';
import 'package:job_test/presentation/widgets/select_button_widget.dart';
import 'package:job_test/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/core/unknown_error.dart';
import 'package:job_test/presentation/widgets/about_hotel_widget.dart';
import 'package:job_test/presentation/widgets/rating_widget.dart';
import 'package:job_test/presentation/widgets/tourist_information_widget.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is Empty) {
            return const SizedBox(
              height: 1,
            );
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Loaded) {
            return _Booking(booking: state.booking);
          } else if (state is Error) {
            return ServerError(message: state.message);
          } else {
            return const UnknownError();
          }
        },
      ),
    );
  }
}

class _Booking extends StatefulWidget {
  final Booking booking;

  const _Booking({required this.booking});

  @override
  State<_Booking> createState() => _BookingState();
}

class _BookingState extends State<_Booking> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;
    final formatter = NumberFormat('#,###');

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xfff6f6f9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const NavigationPanelWidget(text: 'Бронирование'),
              SizedBox(
                height: 8 * fem,
              ),
              Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(15 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingWidget(
                          rating: widget.booking.horating.toString(),
                          ratingTitle: widget.booking.ratingName),
                      AboutHotelWidget(
                          hotelName: widget.booking.hotelName,
                          hotelAdress: widget.booking.hotelAdress),
                    ],
                  )),
              AboutBookingWidget(booking: widget.booking),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AboutBuyerWidget(booking: widget.booking),
                    const TouristInformationBlocWidget(),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
                padding:
                    EdgeInsets.fromLTRB(16 * fem, 16 * fem, 16 * fem, 15 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12 * fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Тур',
                          style: SafeGoogleFont(
                            'SF Pro Display',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2000000477 * ffem / fem,
                            color: const Color(0xff828796),
                          ),
                        ),
                        Text(
                          '${formatter.format(widget.booking.tourPrice).replaceAll(',', ' ')} ₽',
                          textAlign: TextAlign.right,
                          style: SafeGoogleFont(
                            'SF Pro Display',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2000000477 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15 * fem,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Топливный сбор',
                          style: SafeGoogleFont(
                            'SF Pro Display',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2000000477 * ffem / fem,
                            color: Color(0xff828796),
                          ),
                        ),
                        Text(
                          '${formatter.format(widget.booking.fuelCharge).replaceAll(',', ' ')} ₽',
                          textAlign: TextAlign.right,
                          style: SafeGoogleFont(
                            'SF Pro Display',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2000000477 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15 * fem,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Сервисный сбор',
                          style: SafeGoogleFont(
                            'SF Pro Display',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2000000477 * ffem / fem,
                            color: Color(0xff828796),
                          ),
                        ),
                        Text(
                          '${formatter.format(widget.booking.serviceCharge).replaceAll(',', ' ')} ₽',
                          textAlign: TextAlign.right,
                          style: SafeGoogleFont(
                            'SF Pro Display',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2000000477 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15 * fem,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'К оплате',
                          style: SafeGoogleFont(
                            'SF Pro Display',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2000000477 * ffem / fem,
                            color: const Color(0xff828796),
                          ),
                        ),
                        Text(
                          '${formatter.format(widget.booking.tourPrice + widget.booking.fuelCharge + widget.booking.serviceCharge).replaceAll(',', ' ')} ₽',
                          textAlign: TextAlign.right,
                          style: SafeGoogleFont(
                            'SF Pro Display',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.2000000477 * ffem / fem,
                            color: const Color(0xff0d72ff),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.fromLTRB(16 * fem, 12 * fem, 16 * fem, 12 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffe8e9ec)),
                  color: const Color(0xffffffff),
                ),
                child: SelectButtonWidget(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PaidPage()));
                      }
                    },
                    text:
                        'Оплатить ${formatter.format(widget.booking.tourPrice + widget.booking.fuelCharge + widget.booking.serviceCharge).replaceAll(',', ' ')} ₽'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
