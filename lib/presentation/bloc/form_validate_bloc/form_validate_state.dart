part of 'form_validate_bloc.dart';

class FormValidateState extends Equatable {
  final bool isValidNumber;
  final bool isValidEmail;
  final Map? formKey;

  const FormValidateState({
    this.isValidNumber = true,
    this.isValidEmail = true,
    this.formKey,
  });

  FormValidateState copyWith({
    bool? isValidNumber,
    bool? isValidEmail,
    Map? isFormKey,
  }) {
    return FormValidateState(
      isValidNumber: isValidNumber ?? this.isValidNumber,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      formKey: isFormKey ?? this.formKey,
    );
  }

  @override
  List<Object?> get props => [isValidNumber, isValidEmail, formKey];
}
