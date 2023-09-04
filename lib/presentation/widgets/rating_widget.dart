import 'package:flutter/material.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/utils.dart';

class RatingWidget extends StatelessWidget {
  final String rating;
  final String ratingTitle;

  const RatingWidget({
    super.key,
    required this.rating,
    required this.ratingTitle,
  });

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Container(
      margin: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 0 * fem, 8 * fem),
      width: 149 * fem,
      height: 29 * fem,
      decoration: BoxDecoration(
        color: const Color(0x33ffc600),
        borderRadius: BorderRadius.circular(5 * fem),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.star,
            size: 15 * fem,
            color: const Color(0xFFFFA902),
          ),
          Row(
            children: [
              Text(
                rating,
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'SF Pro Display',
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2000000477 * ffem / fem,
                  color: const Color(0xffffa800),
                ),
              ),
              Text(
                ' $ratingTitle',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'SF Pro Display',
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2000000477 * ffem / fem,
                  color: const Color(0xffffa800),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
