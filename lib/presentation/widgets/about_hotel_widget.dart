import 'package:flutter/material.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/utils.dart';

class AboutHotelWidget extends StatelessWidget {
  final String hotelName;
  final String hotelAdress;

  const AboutHotelWidget({
    super.key,
    required this.hotelName,
    required this.hotelAdress,
  });

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16 * fem, 0 * fem, 0 * fem, 7 * fem),
          child: Text(
            hotelName,
            style: SafeGoogleFont(
              'SF Pro Display',
              fontSize: 22 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.2000000694 * ffem / fem,
              color: const Color(0xff000000),
            ),
          ),
        ),
        Container(
          // title1T5 (1:729)
          margin: EdgeInsets.fromLTRB(16 * fem, 0 * fem, 0 * fem, 16 * fem),
          child: Text(
            hotelAdress,
            style: SafeGoogleFont(
              'SF Pro Display',
              fontSize: 14 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.2000000817 * ffem / fem,
              color: const Color(0xff0d72ff),
            ),
          ),
        ),
      ],
    );
  }
}
