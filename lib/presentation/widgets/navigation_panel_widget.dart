import 'package:flutter/material.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/utils.dart';

class NavigationPanelWidget extends StatelessWidget {
  final String text;
  const NavigationPanelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Container(
      padding: EdgeInsets.fromLTRB(
          16 * fem, 14 * fem, 14.34 * fem, 11 * fem),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(
            0 * fem, 0 * fem, 90.66 * fem, 0 * fem),
        width: double.infinity,
        child:
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(
                    0 * fem, 0 * fem, 59 * fem, 0 * fem),
                width: 32 * fem,
                height: 32 * fem,
                child: Image.asset(
                  'assets/page-1/images/navigation-bar-left-acsessories-left-acsessories.png',
                  width: 32 * fem,
                  height: 32 * fem,
                ),
              ),
            ),
            Expanded(
              child: Text(
                text,
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
          ],
        ),
      ),
    );
  }
}
