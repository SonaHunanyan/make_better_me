import 'package:equatable/equatable.dart';

abstract class LogInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogInInitialState extends LogInState {}

class UsernameValidatedState extends LogInState {}

class UsernameInvalidState extends LogInState {
  UsernameInvalidState({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}

class PasswordValidatedState extends LogInState {}

class PasswordInvalidState extends LogInState {
  PasswordInvalidState({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}

class FormValidState extends LogInState {}

class FormInvalidState extends LogInState {
  FormInvalidState({this.passwordErrorMessage, this.usernameErrorMessage});
  final String? passwordErrorMessage;
  final String? usernameErrorMessage;
  @override
  List<Object?> get props => [passwordErrorMessage, usernameErrorMessage];
}
