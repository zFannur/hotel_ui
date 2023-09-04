import 'package:flutter/material.dart';
import 'package:job_test/presentation/pages/hotel_page.dart';
import 'package:job_test/presentation/widgets/navigation_panel_widget.dart';
import 'package:job_test/presentation/widgets/select_button_widget.dart';
import 'package:job_test/utils.dart';
import 'package:job_test/core/config/app_config.dart';

class PaidPage extends StatelessWidget {
  const PaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(40 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const NavigationPanelWidget(text: 'Заказ оплачен'),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      22.5 * fem, 122 * fem, 22.5 * fem, 232 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            117.5 * fem, 0 * fem, 118.5 * fem, 32 * fem),
                        padding: EdgeInsets.fromLTRB(
                            25 * fem, 25 * fem, 25 * fem, 25 * fem),
                        decoration: BoxDecoration(
                          color: const Color(0xfff6f6f9),
                          borderRadius: BorderRadius.circular(1000 * fem),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 44 * fem,
                            height: 44 * fem,
                            child: Image.asset(
                              'assets/page-1/images/party-popper.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 19 * fem),
                        child: Text(
                          'Ваш заказ принят в работу',
                          textAlign: TextAlign.center,
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
                        constraints: BoxConstraints(
                          maxWidth: 330 * fem,
                        ),
                        child: Text(
                          'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                          textAlign: TextAlign.center,
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
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      16 * fem, 12 * fem, 16 * fem, 8 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffe8e9ec)),
                    color: const Color(0xffffffff),
                  ),
                  child: SelectButtonWidget(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HotelPage()),
                        ModalRoute.withName('/'),
                      );
                    },
                    text: 'Супер!',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
