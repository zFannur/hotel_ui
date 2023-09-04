import 'package:flutter/material.dart';
import 'package:job_test/entity/booking.dart';
import 'package:job_test/utils.dart';
import 'package:job_test/core/config/app_config.dart';
import 'custom_text_field_widget.dart';

class AboutBuyerWidget extends StatefulWidget {
  final Booking booking;

  const AboutBuyerWidget({
    super.key,
    required this.booking,
  });

  @override
  State<AboutBuyerWidget> createState() => _AboutBuyerWidgetState();
}

class _AboutBuyerWidgetState extends State<AboutBuyerWidget> {
  final TextEditingController _numberController =
      TextEditingController(text: '+7 (951) 555-99-00');
  final TextEditingController _emailController =
      TextEditingController(text: 'examplemail.000@mail.ru');

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
      padding: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 16 * fem, 0 * fem),
      width: double.infinity,
      height: 232 * fem,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(12 * fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 35 * fem, 19 * fem),
            child: Text(
              'Информация о покупателе',
              style: SafeGoogleFont(
                'SF Pro Display',
                fontSize: 22 * ffem,
                fontWeight: FontWeight.w500,
                height: 1.2000000694 * ffem / fem,
                color: const Color(0xff000000),
              ),
            ),
          ),
          NumberTextFieldWidget(
            controller: _numberController,
            validator: (val) {
              if (!val.toString().isValidPhone) {
                return false;
              } else {
                return true;
              }
            },
          ),
          SizedBox(
            height: 8 * fem,
          ),
          CustomTextFieldWidget(
            controller: _emailController,
            name: 'Почта',
            validator: (val) {
              if (!val.toString().isValidEmail) {
                return false;
              } else {
                return true;
              }
            },
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 10 * fem, 3 * fem, 0 * fem),
            constraints: BoxConstraints(
              maxWidth: 340 * fem,
            ),
            child: Text(
              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
              style: SafeGoogleFont(
                'SF Pro Display',
                fontSize: 14 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.2000000817 * ffem / fem,
                color: const Color(0xff828796),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^((8|\+7)[\- ]?)?\(?\d{3,5}\)?[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}(([\- ]?\d{1})?[\- ]?\d{1}?[\- ]?\d{1})?$");
    return phoneRegExp.hasMatch(this);
  }
}
