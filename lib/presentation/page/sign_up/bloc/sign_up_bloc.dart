import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_better_me/presentation/page/sign_up/bloc/sign_up_event.dart';
import 'package:make_better_me/presentation/page/sign_up/bloc/sign_up_state.dart';
import 'package:make_better_me/presentation/util/validator.dart';
import '../../../extension/bloc_transform.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<UsernameValidationEvent>(_onUsernameValidationEvent,
        transformer: debounce(const Duration(milliseconds: 500)));
    on<NameValidationEvent>(_onNameValidationEvent,
        transformer: debounce(const Duration(milliseconds: 500)));
    on<PasswordValidationEvent>(_onPasswordValidationEvent,
        transformer: debounce(const Duration(milliseconds: 500)));
    on<FormValidationEvent>(_onFormValidationEvent);
  }

  Future<void> _onUsernameValidationEvent(
      UsernameValidationEvent event, Emitter<SignUpState> emit) async {
    final errorText = Validators.emptyValidators(event.username);
    if (errorText == null) {
      emit(UsernameValidatedState());
      return;
    }

    emit(UsernameInvalidState(errorMessage: errorText));
  }

  Future<void> _onNameValidationEvent(
      NameValidationEvent event, Emitter<SignUpState> emit) async {
    final errorText = Validators.emptyValidators(event.name);
    if (errorText == null) {
      emit(NameValidatedState());
      return;
    }

    emit(NameInvalidState(errorMessage: errorText));
  }

  Future<void> _onPasswordValidationEvent(
      PasswordValidationEvent event, Emitter<SignUpState> emit) async {
    final errorText = Validators.passwordValidators(event.password);
    if (errorText == null) {
      emit(PasswordValidatedState());
      return;
    }

    emit(PasswordInvalidState(errorMessage: errorText));
  }

  Future<void> _onFormValidationEvent(
      FormValidationEvent event, Emitter<SignUpState> emit) async {
    final nameErrorText = Validators.emptyValidators(event.name);
    final usernameErrorText = Validators.emptyValidators(event.username);
    final passwordErrorText = Validators.passwordValidators(event.password);
    if (nameErrorText == null &&
        usernameErrorText == null &&
        passwordErrorText == null) {
      emit(FormValidState());
      return;
    }
    emit(FormInvalidState(
        nameErrorMessage: nameErrorText,
        usernameErrorMessage: usernameErrorText,
        passwordErrorMessage: passwordErrorText));
  }
}