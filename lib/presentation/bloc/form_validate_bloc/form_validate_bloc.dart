import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_validate_event.dart';
part 'form_validate_state.dart';

class FormValidateBloc extends Bloc<FormValidateEvent, FormValidateState> {
  FormValidateBloc() : super(const FormValidateState()) {
    on<ChangeFormEvent>((event, emit) {
      Map res = state.formKey ?? {'Первый турист ': 'Первый турист '};

      if (event.email != null) {
        if (event.email!.isValidEmail) {
          emit(state.copyWith(isValidEmail: true));
        } else {
          emit(state.copyWith(isValidEmail: false));
        }
      }
      if (event.number != null) {
        if (event.number!.isValidPhone) {
          emit(state.copyWith(isValidNumber: true));
        } else {
          emit(state.copyWith(isValidNumber: false));
        }
      }
      if (event.form != null) {
        if (res.keys.toList().contains(event.form!.keys.first)) {
          res.update(event.form!.keys.first, (value) => event.form!.values.first);
        } else {
          res.putIfAbsent(event.form!.keys.first, () => event.form!.values.first);
        }
        emit(state.copyWith(isFormKey: res));
      }
    });
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^((8|\+7)[\- ]?)?\(?\d{3,5}\)?[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}(([\- ]?\d{1})?[\- ]?\d{1}?[\- ]?\d{1})?$");
    return phoneRegExp.hasMatch(this);
  }
}
