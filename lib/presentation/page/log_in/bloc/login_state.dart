import 'package:equatable/equatable.dart';
import 'package:make_better_me/domain/entity/user.dart';
import 'package:uuid/uuid.dart';

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

class LogInSuccessfulyState extends LogInState {
  LogInSuccessfulyState(this.user);
  final User user;
}

class LoginProcessState extends LogInState {}

class LogInFailState extends LogInState {
  final _id = const Uuid().v4();
  @override
  List<Object?> get props => [_id];
}
