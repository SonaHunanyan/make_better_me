import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_better_me/data/repository/user_repository.dart';
import 'package:make_better_me/presentation/constant/constans.dart';
import 'package:make_better_me/presentation/extension/app_theme.dart';
import 'package:make_better_me/presentation/modal/error_dialog.dart';
import 'package:make_better_me/presentation/page/log_in/bloc/login_state.dart';
import 'package:make_better_me/presentation/themes/app_strings.dart';
import 'package:make_better_me/presentation/widget/app_text_field.dart';
import 'package:make_better_me/presentation/widget/rounded_button.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<StatefulWidget> createState() => _LogInState();
}

class _LogInState extends State<LogInPage> {
  String? _passwordErrorText;
  String? _usernameErrorText;

  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  final _loginBloc = LoginBloc(userRepository: UserRepository());

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => _loginBloc,
        child: BlocListener<LoginBloc, LogInState>(
          listener: _blocListener,
          child: BlocBuilder<LoginBloc, LogInState>(
              builder: (context, state) => _render),
        ));
  }

  Widget get _render => Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15 * grw(context)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.logIn,
                        style: context.themeData.textTheme.headline1,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10 * grh(context)),
                          child: AppTextField(
                            labelText: AppStrings.username,
                            errorText: _usernameErrorText,
                            controller: _usernameController,
                            onChange: (value) {
                              _loginBloc.add(
                                  UsernameValidationEvent(username: value));
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              top: 10 * grh(context),
                              bottom: 20 * grh(context)),
                          child: AppTextField(
                            labelText: AppStrings.password,
                            errorText: _passwordErrorText,
                            controller: _passwordController,
                            onChange: (value) {
                              _loginBloc.add(
                                  PasswordValidationEvent(password: value));
                            },
                          )),
                      RoundedButton(
                          onTap: () {
                            _loginBloc.add(FormValidationEvent(
                                password: _passwordController.text,
                                username: _usernameController.text));
                          },
                          title: AppStrings.logIn)
                    ]))),
      );
}

extension _LogInStateAddition on _LogInState {
  void _blocListener(BuildContext context, LogInState state) {
    if (state is UsernameInvalidState) {
      _usernameErrorText = state.errorMessage;
    }
    if (state is PasswordInvalidState) {
      _passwordErrorText = state.errorMessage;
    }
    if (state is FormInvalidState) {
      _passwordErrorText = state.passwordErrorMessage;
      _usernameErrorText = state.usernameErrorMessage;
    }
    if (state is UsernameValidatedState) {
      _usernameErrorText = null;
    }
    if (state is PasswordValidatedState) {
      _passwordErrorText = null;
    }
    if (state is FormValidState) {
      _usernameErrorText = null;
      _passwordErrorText = null;
      _loginBloc.add(LogIn(
          password: _passwordController.text,
          username: _usernameController.text));
    }
    if (state is LogInSuccessfulyState) {}
    if (state is LogInFailState) {
      showErrorDialog(context, message: AppStrings.userDoesntExist);
    }
  }
}
