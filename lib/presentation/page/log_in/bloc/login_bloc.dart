import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_better_me/domain/repository/user_repository.dart';
import 'package:make_better_me/presentation/util/validator.dart';
import '../../../extension/bloc_transform.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LogInEvent, LogInState> {
  LoginBloc({required this.userRepository}) : super(LogInInitialState()) {
    on<UsernameValidationEvent>(_onUsernameValidationEvent,
        transformer: debounce(const Duration(milliseconds: 500)));
    on<PasswordValidationEvent>(_onPasswordValidationEvent,
        transformer: debounce(const Duration(milliseconds: 500)));
    on<FormValidationEvent>(_onFormValidationEvent);
    on<LogIn>(_onLogInEvent);
  }

  final IUserRepository userRepository;

  Future<void> _onUsernameValidationEvent(
      UsernameValidationEvent event, Emitter<LogInState> emit) async {
    final errorText = Validators.emptyValidators(event.username);
    if (errorText == null) {
      emit(UsernameValidatedState());
      return;
    }

    emit(UsernameInvalidState(errorMessage: errorText));
  }

  Future<void> _onPasswordValidationEvent(
      PasswordValidationEvent event, Emitter<LogInState> emit) async {
    final errorText = Validators.passwordValidators(event.password);
    if (errorText == null) {
      emit(PasswordValidatedState());
      return;
    }

    emit(PasswordInvalidState(errorMessage: errorText));
  }

  Future<void> _onFormValidationEvent(
      FormValidationEvent event, Emitter<LogInState> emit) async {
    final usernameErrorText = Validators.emptyValidators(event.username);
    final passwordErrorText = Validators.passwordValidators(event.password);
    if (usernameErrorText == null && passwordErrorText == null) {
      emit(FormValidState());
      return;
    }
    emit(FormInvalidState(
        usernameErrorMessage: usernameErrorText,
        passwordErrorMessage: passwordErrorText));
  }

  Future<void> _onLogInEvent(LogIn event, Emitter<LogInState> emit) async {
    emit(LoginProcessState());
    final user = await userRepository.logIn(event.username, event.password);
    if (user == null) {
      emit(LogInFailState());
      return;
    }
    emit(LogInSuccessfulyState(user));
  }
}
