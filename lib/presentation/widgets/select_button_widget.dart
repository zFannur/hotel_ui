import 'package:flutter/material.dart';

import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/utils.dart';

class SelectButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  const SelectButtonWidget({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48 * fem,
        decoration: BoxDecoration(
          color: const Color(0xff0d72ff),
          borderRadius: BorderRadius.circular(15 * fem),
        ),
        child: Center(
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'SF Pro Display',
                fontSize: 16 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.1000000238 * ffem / fem,
                letterSpacing: 0.1000000015 * fem,
                color: const Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
