import 'package:flutter/material.dart';
import 'package:job_test/presentation/widgets/about_hotel_widget.dart';
import 'package:job_test/presentation/widgets/rating_widget.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/utils.dart';
import 'package:intl/intl.dart';
import 'package:job_test/entity/hotel.dart';

class MainDataAboutHotelWidget extends StatelessWidget {
  final Hotel hotel;

  const MainDataAboutHotelWidget({
    super.key, required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;
    final formatter = NumberFormat('#,###');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingWidget(rating: hotel.rating, ratingTitle: hotel.ratingName),
        AboutHotelWidget(hotelName: hotel.name, hotelAdress: hotel.adress),
        Container(
          margin: EdgeInsets.fromLTRB(16 * fem, 0 * fem, 19 * fem, 19 * fem),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 13 * fem, 0 * fem),
                child: Text(
                  'от ${formatter.format(hotel.minimalPrice).replaceAll(',', ' ')} ₽',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.2 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 2 * fem),
                child: Text(
                  hotel.priceForIt,
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xff828796),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
