import 'package:flutter/material.dart';
import 'package:job_test/entity/booking.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/utils.dart';

class AboutBookingWidget extends StatelessWidget {
  final Booking booking;

  const AboutBookingWidget({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
      padding: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 22 * fem, 15 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(12 * fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Вылет из',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff828796),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  booking.departure,
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15 * fem,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Страна, город',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff828796),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  booking.arrivalCountry,
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15 * fem,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Даты',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff828796),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${booking.tourDateStart} – ${booking.tourDateStop}',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15 * fem,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Кол-во ночей',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff828796),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${booking.numberOfNights} ночей',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15 * fem,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Отель',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff828796),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  booking.hotelName,
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15 * fem,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Номер',
                    style: SafeGoogleFont(
                      'SF Pro Display',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2000000477 * ffem / fem,
                      color: const Color(0xff828796),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    booking.room,
                    overflow: TextOverflow.ellipsis,
                    style: SafeGoogleFont(
                      'SF Pro Display',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2000000477 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15 * fem,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Питание',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff828796),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  booking.nutrition,
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
