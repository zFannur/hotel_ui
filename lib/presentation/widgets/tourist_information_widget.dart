import 'package:flutter/material.dart';
import 'package:job_test/presentation/bloc/form_validate_bloc/form_validate_bloc.dart';
import 'package:job_test/presentation/widgets/custom_text_field_widget.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'dart:math' as math;
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TouristInformationBlocWidget extends StatefulWidget {
  const TouristInformationBlocWidget({super.key});

  @override
  State<TouristInformationBlocWidget> createState() =>
      _TouristInformationBlocWidgetState();
}

class _TouristInformationBlocWidgetState
    extends State<TouristInformationBlocWidget> {
  List<String> listNumTourist = [
    'Первый турист',
    'Второй турист',
    'Третий турист',
    'Четвертый турист',
    'Пятый турист',
  ];

  List<Widget> touristInformationList = [
    const TouristInformationWidget(
      countName: 'Первый турист ',
      name: 'Иван',
      firstName: 'Иванов',
      isExpanded: true,
    ),
  ];

  @override
  void initState() {
    context.read<FormValidateBloc>().add(const ChangeFormEvent(form: {'Первый турист ': 'Первый турист '}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;

    return Column(
      children: [
        Column(
          children: List.generate(touristInformationList.length, (index) {
            return touristInformationList[index];
          }),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
          padding: EdgeInsets.fromLTRB(16 * fem, 13 * fem, 8 * fem, 8 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(12 * fem),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Добавить туриста',
                  style: SafeGoogleFont(
                    'SF Pro Display',
                    fontSize: 22 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.2000000694 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  touristInformationList.add(
                    TouristInformationWidget(
                      countName: listNumTourist[touristInformationList.length],
                      name: '',
                      firstName: '',
                      isExpanded: false,
                    ),
                  );
                  context.read<FormValidateBloc>().add(ChangeFormEvent(form: {listNumTourist[touristInformationList.length]: listNumTourist[touristInformationList.length]}));
                  setState(() {});
                },
                child: Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 32 * fem, 0 * fem),
                  padding:
                      EdgeInsets.fromLTRB(8 * fem, 8 * fem, 8 * fem, 8 * fem),
                  decoration: BoxDecoration(
                    color: const Color(0xFF008FFF),
                    borderRadius: BorderRadius.circular(12 * fem),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TouristInformationWidget extends StatefulWidget {
  final String countName;
  final String name;
  final String firstName;
  final bool isExpanded;

  const TouristInformationWidget({
    super.key,
    required this.countName,
    required this.name,
    required this.firstName,
    required this.isExpanded,
  });

  @override
  State<TouristInformationWidget> createState() =>
      _TouristInformationWidgetState();
}

class _TouristInformationWidgetState extends State<TouristInformationWidget> {
  late final TextEditingController nameController;
  late final TextEditingController firstNameController;
  final TextEditingController dateBornController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController passwordNumberController =
      TextEditingController();
  final TextEditingController passwordDateEndController =
      TextEditingController();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    firstNameController = TextEditingController(text: widget.firstName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;
    final bloc = context.read<FormValidateBloc>().state;

    return ExpansionWidget(
      initiallyExpanded: widget.isExpanded,
      titleBuilder: (double animationValue, _, bool isExpaned, toogleFunction) {
        return InkWell(
            onTap: () => toogleFunction(animated: true),
            child: Container(
              margin: !isExpaned
                  ? EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem)
                  : const EdgeInsets.all(0),
              padding:
                  EdgeInsets.fromLTRB(16 * fem, 13 * fem, 16 * fem, 16 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: isExpaned
                    ? BorderRadius.only(
                        topLeft: Radius.circular(12 * fem),
                        topRight: Radius.circular(12 * fem),
                      )
                    : BorderRadius.circular(12 * fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      widget.countName,
                      style: SafeGoogleFont(
                        'SF Pro Display',
                        fontSize: 22 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2000000694 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 32 * fem, 0 * fem),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          8 * fem, 8 * fem, 8 * fem, 8 * fem),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9F1FF),
                        borderRadius: BorderRadius.circular(12 * fem),
                      ),
                      child: Transform.rotate(
                        angle: math.pi * animationValue,
                        alignment: Alignment.center,
                        child: Transform.rotate(
                            angle: 180 * math.pi / 120,
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFF008FFF),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
      content: Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
        padding: EdgeInsets.fromLTRB(16 * fem, 13 * fem, 16 * fem, 16 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12 * fem),
            bottomRight: Radius.circular(12 * fem),
          ),
        ),
        child: Form(
          key: LabeledGlobalKey<FormState>(bloc.formKey?[widget.countName]),
          child: Column(
            children: [
              CustomTextFieldWidget(
                controller: nameController,
                name: 'Имя',
                validator: isNotNullValidator,
              ),
              SizedBox(
                height: 8 * fem,
              ),
              CustomTextFieldWidget(
                controller: firstNameController,
                name: 'Фамилия',
              ),
              SizedBox(
                height: 8 * fem,
              ),
              CustomTextFieldWidget(
                controller: dateBornController,
                name: 'Дата рождения',
              ),
              SizedBox(
                height: 8 * fem,
              ),
              CustomTextFieldWidget(
                controller: countryController,
                name: 'Гражданство',
              ),
              SizedBox(
                height: 8 * fem,
              ),
              CustomTextFieldWidget(
                controller: passwordNumberController,
                name: 'Номер загранпаспорта',
              ),
              SizedBox(
                height: 8 * fem,
              ),
              CustomTextFieldWidget(
                controller: passwordDateEndController,
                name: 'Срок действия загранпаспорта',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? isNotNullValidator(String? val) {
    if (val?.isEmpty ?? true) {
      return '';
    }
    return null;
  }
}
