import 'package:equatable/equatable.dart';
import 'package:make_better_me/domain/entity/user.dart';
import 'package:uuid/uuid.dart';

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

class UserCreatedSuccessfuly extends SignUpState {
  UserCreatedSuccessfuly({required this.user});
  final User user;
}

class UserCreationFail extends SignUpState {
  final _id = const Uuid().v4();
  @override
  List<Object?> get props => [_id];
}
