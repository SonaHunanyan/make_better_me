import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpInitialState extends SignUpState {}

class NameValidatedState extends SignUpState {}

class NameInvalidState extends SignUpState {
  NameInvalidState({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}

class UsernameValidatedState extends SignUpState {}

class UsernameInvalidState extends SignUpState {
  UsernameInvalidState({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}

class PasswordValidatedState extends SignUpState {}

class PasswordInvalidState extends SignUpState {
  PasswordInvalidState({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}

class FormValidState extends SignUpState {}

class FormInvalidState extends SignUpState {
  FormInvalidState(
      {this.nameErrorMessage,
      this.passwordErrorMessage,
      this.usernameErrorMessage});
  final String? passwordErrorMessage;
  final String? usernameErrorMessage;
  final String? nameErrorMessage;
  @override
  List<Object?> get props =>
      [passwordErrorMessage, usernameErrorMessage, nameErrorMessage];
}
