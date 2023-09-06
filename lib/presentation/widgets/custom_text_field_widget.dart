import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/presentation/bloc/form_validate_bloc/form_validate_bloc.dart';
import 'package:job_test/utils.dart';


class NumberTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const NumberTextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;
    final isValid = context.watch<FormValidateBloc>().state;

    return Container(
      padding: EdgeInsets.fromLTRB(16 * fem, 10 * fem, 16 * fem, 0 * fem),
      width: double.infinity,
      height: 52 * fem,
      decoration: BoxDecoration(
        color: isValid.isValidNumber ? const Color(0xfff6f6f9) : const Color(0xFFEB5757).withOpacity(0.15),
        borderRadius: BorderRadius.circular(10 * fem),
      ),
      child: TextFormField(
        style: SafeGoogleFont(
          'SF Pro Display',
          fontSize: 16 * ffem,
          fontWeight: FontWeight.w400,
          height: 1.1000000238 * ffem / fem,
          letterSpacing: 0.75 * fem,
          color: const Color(0xff14132a),
        ),
        controller: controller,
        onEditingComplete: () {
          context.read<FormValidateBloc>().add(ChangeFormEvent(number: controller.text));
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          TextInputMask(mask: '\\+9? (999) 999-99-99'),
        ],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 15.0),
          hintStyle: SafeGoogleFont(
            'SF Pro Display',
            fontSize: 17 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2000000898 * ffem / fem,
            letterSpacing: 0.17 * fem,
            color: const Color(0xffa8abb6),
          ),
          labelStyle: SafeGoogleFont(
            'SF Pro Display',
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2000000477 * ffem / fem,
            letterSpacing: 0.12 * fem,
            color: const Color(0xffa8abb6),
          ),
          labelText: controller.text.isNotEmpty ? 'Номер телефона' : null,
          hintText: controller.text.isEmpty ? 'Номер телефона' : null,
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class EmailTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;
    final isValid = context.watch<FormValidateBloc>().state;

    return Container(
      padding: EdgeInsets.fromLTRB(16 * fem, 10 * fem, 16 * fem, 0 * fem),
      width: double.infinity,
      height: 52 * fem,
      decoration: BoxDecoration(
        color: isValid.isValidEmail ? const Color(0xfff6f6f9) : const Color(0xFFEB5757).withOpacity(0.15),
        borderRadius: BorderRadius.circular(10 * fem),
      ),
      child: TextFormField(
        style: SafeGoogleFont(
          'SF Pro Display',
          fontSize: 16 * ffem,
          fontWeight: FontWeight.w400,
          height: 1.1000000238 * ffem / fem,
          letterSpacing: 0.75 * fem,
          color: const Color(0xff14132a),
        ),
        controller: controller,
        onEditingComplete: () {
          context.read<FormValidateBloc>().add(ChangeFormEvent(email: controller.text));
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 15.0),
          hintStyle: SafeGoogleFont(
            'SF Pro Display',
            fontSize: 17 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2000000898 * ffem / fem,
            letterSpacing: 0.17 * fem,
            color: const Color(0xffa8abb6),
          ),
          labelStyle: SafeGoogleFont(
            'SF Pro Display',
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2000000477 * ffem / fem,
            letterSpacing: 0.12 * fem,
            color: const Color(0xffa8abb6),
          ),
          labelText: controller.text.isNotEmpty ? 'Почта' : null,
          hintText: controller.text.isEmpty ? 'Почта' : null,
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final String? Function(String?)? validator;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.name,
    this.validator,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Container(
      padding: EdgeInsets.fromLTRB(16 * fem, 10 * fem, 16 * fem, 0 * fem),
      width: double.infinity,
      height: 52 * fem,
      decoration: BoxDecoration(
        color: isValid ? const Color(0xfff6f6f9) : const Color(0xFFEB5757).withOpacity(0.15),
        borderRadius: BorderRadius.circular(10 * fem),
      ),
      child: TextFormField(
        style: SafeGoogleFont(
          'SF Pro Display',
          fontSize: 16 * ffem,
          fontWeight: FontWeight.w400,
          height: 1.1000000238 * ffem / fem,
          letterSpacing: 0.75 * fem,
          color: const Color(0xff14132a),
        ),
        controller: widget.controller,
        onChanged: (val) {
          isValid = isNotNullValidator(widget.controller.text);
          setState(() {});
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 15.0),
          hintStyle: SafeGoogleFont(
            'SF Pro Display',
            fontSize: 17 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2000000898 * ffem / fem,
            letterSpacing: 0.17 * fem,
            color: const Color(0xffa8abb6),
          ),
          labelStyle: SafeGoogleFont(
            'SF Pro Display',
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2000000477 * ffem / fem,
            letterSpacing: 0.12 * fem,
            color: const Color(0xffa8abb6),
          ),
          labelText: widget.controller.text.isNotEmpty ? widget.name : null,
          hintText: widget.controller.text.isEmpty ? widget.name : null,
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  bool isNotNullValidator(String val) {
    if (val.isEmpty) {
      return false;
    }
    return true;
  }
}
