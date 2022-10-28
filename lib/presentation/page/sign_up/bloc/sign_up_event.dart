
abstract class SignUpEvent {}

class NameValidationEvent extends SignUpEvent {
  NameValidationEvent({required this.name});
  final String name;
}

class UsernameValidationEvent extends SignUpEvent {
  UsernameValidationEvent({required this.username});
  final String username;
}

class PasswordValidationEvent extends SignUpEvent {
  PasswordValidationEvent({required this.password});
  final String password;
}

class FormValidationEvent extends SignUpEvent {
  FormValidationEvent(
      {required this.name, required this.password, required this.username});
  final String name;
  final String username;
  final String password;
}
