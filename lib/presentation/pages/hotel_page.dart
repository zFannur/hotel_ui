import 'package:flutter/material.dart';
import 'package:job_test/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:job_test/presentation/pages/rooms_page.dart';
import 'package:job_test/presentation/widgets/select_button_widget.dart';
import 'package:job_test/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/core/unknown_error.dart';
import 'package:job_test/entity/hotel.dart';
import 'package:job_test/presentation/widgets/carousel_widget.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/presentation/widgets/main_data_about_hotel_widget.dart';
import 'package:job_test/presentation/widgets/detail_data_about_hotel_widget.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state is Empty) {
            return const SizedBox(
              height: 1,
            );
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Loaded) {
            return _Hotel(hotel: state.hotel);
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

class _Hotel extends StatelessWidget {
  final Hotel hotel;

  const _Hotel({required this.hotel});

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xfff6f6f9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12 * fem),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(11 * fem),
                      child: Text(
                        'Отель',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'SF Pro Display',
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.2000000212 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          16 * fem, 0 * fem, 16 * fem, 16 * fem),
                      width: double.infinity,
                      height: 257 * fem,
                      child: CarouselWidget(imagesUrl: hotel.imageUrls),
                    ),
                    MainDataAboutHotelWidget(hotel: hotel),
                  ],
                ),
              ),
              SizedBox(
                height: 8 * fem,
              ),
              DetailDataAboutWidget(hotel: hotel),
              Container(
                padding:
                    EdgeInsets.fromLTRB(16 * fem, 12 * fem, 16 * fem, 8 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffe8e9ec)),
                  color: const Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 15 * fem),
                      child: SelectButtonWidget(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RoomsPage(name: hotel.name)));
                        },
                        text: 'К выбору номера',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
