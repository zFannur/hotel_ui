import 'package:flutter/material.dart';
import 'package:job_test/utils.dart';
import 'package:job_test/core/config/app_config.dart';

class PeculiaritiesList extends StatelessWidget {
  final List<String> peculiarities;
  const PeculiaritiesList({super.key, required this.peculiarities});


  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Wrap(
      children: List.generate(peculiarities.length, (index) => FittedBox(
        child: Container(
          padding: EdgeInsets.fromLTRB(
            5 * fem, 0 * fem, 5 * fem, 0 * fem),
          margin: EdgeInsets.fromLTRB(
              0 * fem, 8 * fem, 8 * fem, 0 * fem),
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xfffbfbfc),
            borderRadius: BorderRadius.circular(5 * fem),
          ),
          child: Center(
            child: Text(
              peculiarities[index],
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'SF Pro Display',
                fontSize: 16 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2000000477 * ffem / fem,
                color: const Color(0xff828796),
              ),
            ),
          ),
        ),
      ),),
    );
  }
}