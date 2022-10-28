abstract class LogInEvent {}

class UsernameValidationEvent extends LogInEvent {
  UsernameValidationEvent({required this.username});
  final String username;
}

class PasswordValidationEvent extends LogInEvent {
  PasswordValidationEvent({required this.password});
  final String password;
}

class FormValidationEvent extends LogInEvent {
  FormValidationEvent({required this.password, required this.username});
  final String username;
  final String password;
}
