part of 'form_validate_bloc.dart';

abstract class FormValidateEvent extends Equatable {
  const FormValidateEvent();
}

class ChangeFormEvent extends FormValidateEvent {
  final String? number;
  final String? email;
  final Map? form;

  const ChangeFormEvent({
    this.number,
    this.email,
    this.form,
  });

  @override
  List<Object?> get props => [number, email, form];
}
