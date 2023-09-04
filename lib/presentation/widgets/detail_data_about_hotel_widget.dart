import 'package:job_test/entity/hotel.dart';
import 'package:flutter/material.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/presentation/widgets/peculiarities_widget.dart';
import 'package:job_test/utils.dart';

class DetailDataAboutWidget extends StatelessWidget {
  final Hotel hotel;
  const DetailDataAboutWidget({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 12 * fem),
          padding:
          EdgeInsets.fromLTRB(16 * fem, 16 * fem, 15 * fem, 16 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(12 * fem),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    0 * fem, 0 * fem, 0 * fem, 15 * fem),
                child: Text(
                  'Об отеле',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 22 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.2000000694 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              PeculiaritiesList(
                  peculiarities: hotel.aboutTheHotel.peculiarities),
              Container(
                margin: EdgeInsets.fromLTRB(
                    0 * fem, 15 * fem, 0 * fem, 15 * fem),
                constraints: BoxConstraints(
                  maxWidth: 344 * fem,
                ),
                child: Text(
                  hotel.aboutTheHotel.description,
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2000000477 * ffem / fem,
                    color: const Color(0xe5000000),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    15 * fem, 15 * fem, 15 * fem, 15 * fem),
                width: 343 * fem,
                decoration: BoxDecoration(
                  color: const Color(0xfffbfbfc),
                  borderRadius: BorderRadius.circular(15 * fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 8 * fem, 0 * fem),
                        width: double.infinity,
                        height: 38 * fem,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 115 * fem, 0 * fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem,
                                        0 * fem, 12 * fem, 0 * fem),
                                    width: 24 * fem,
                                    height: 24 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/vuesax-linear-emoji-happy.png',
                                      width: 24 * fem,
                                      height: 24 * fem,
                                    ),
                                  ),
                                  SizedBox(
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem,
                                              0 * fem,
                                              0 * fem,
                                              1 * fem),
                                          child: Text(
                                            'Удобства',
                                            style: SafeGoogleFont(
                                              'SF Pro Display',
                                              fontSize: 16 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height:
                                              1.2000000477 * ffem / fem,
                                              color: const Color(0xff2c3035),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Самое необходимое',
                                          style: SafeGoogleFont(
                                            'SF Pro Display',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height:
                                            1.2000000817 * ffem / fem,
                                            color: const Color(0xff828696),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/page-1/images/icons-icons-icons-FYT.png',
                              width: 6 * fem,
                              height: 12 * fem,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 8 * fem, 0 * fem),
                        width: double.infinity,
                        height: 38 * fem,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 115 * fem, 0 * fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem,
                                        0 * fem, 12 * fem, 0 * fem),
                                    width: 24 * fem,
                                    height: 24 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/vuesax-linear-tick-square.png',
                                      width: 24 * fem,
                                      height: 24 * fem,
                                    ),
                                  ),
                                  SizedBox(
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem,
                                              0 * fem,
                                              0 * fem,
                                              1 * fem),
                                          child: Text(
                                            'Что включено',
                                            style: SafeGoogleFont(
                                              'SF Pro Display',
                                              fontSize: 16 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height:
                                              1.2000000477 * ffem / fem,
                                              color: const Color(0xff2c3035),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Самое необходимое',
                                          style: SafeGoogleFont(
                                            'SF Pro Display',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height:
                                            1.2000000817 * ffem / fem,
                                            color: const Color(0xff828696),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/page-1/images/icons-icons-icons.png',
                              width: 6 * fem,
                              height: 12 * fem,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 8 * fem, 0 * fem),
                        width: double.infinity,
                        height: 38 * fem,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 115 * fem, 0 * fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem,
                                        0 * fem, 12 * fem, 0 * fem),
                                    width: 24 * fem,
                                    height: 24 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/vuesax-linear-close-square.png',
                                      width: 24 * fem,
                                      height: 24 * fem,
                                    ),
                                  ),
                                  SizedBox(
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem,
                                              0 * fem,
                                              0 * fem,
                                              1 * fem),
                                          child: Text(
                                            'Что не включено',
                                            style: SafeGoogleFont(
                                              'SF Pro Display',
                                              fontSize: 16 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height:
                                              1.2000000477 * ffem / fem,
                                              color: const Color(0xff2c3035),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Самое необходимое',
                                          style: SafeGoogleFont(
                                            'SF Pro Display',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height:
                                            1.2000000817 * ffem / fem,
                                            color: const Color(0xff828696),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/page-1/images/icons-icons-icons-Axo.png',
                              width: 6 * fem,
                              height: 12 * fem,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
