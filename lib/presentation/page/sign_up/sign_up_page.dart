import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_better_me/presentation/constant/constans.dart';
import 'package:make_better_me/presentation/extension/app_theme.dart';
import 'package:make_better_me/presentation/page/sign_up/bloc/sign_up_event.dart';
import 'package:make_better_me/presentation/page/sign_up/bloc/sign_up_state.dart';
import 'package:make_better_me/presentation/themes/app_strings.dart';
import 'package:make_better_me/presentation/widget/app_text_field.dart';
import 'package:make_better_me/presentation/widget/rounded_button.dart';

import 'bloc/sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  String? _nameErrorText;
  String? _passwordErrorText;
  String? _usernameErrorText;

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  final _signUpBloc = SignUpBloc();

  @override
  void dispose() {
    _signUpBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) => _signUpBloc,
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: _blocListener,
          child: BlocBuilder<SignUpBloc, SignUpState>(
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
                AppStrings.signUp,
                style: context.themeData.textTheme.headline1,
              ),
              AppTextField(
                labelText: AppStrings.name,
                errorText: _nameErrorText,
                controller: _nameController,
                onChange: (value) {
                  _signUpBloc.add(NameValidationEvent(name: value));
                },
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10 * grh(context)),
                  child: AppTextField(
                    labelText: AppStrings.username,
                    errorText: _usernameErrorText,
                    controller: _usernameController,
                    onChange: (value) {
                      _signUpBloc.add(UsernameValidationEvent(username: value));
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: 10 * grh(context), bottom: 20 * grh(context)),
                  child: AppTextField(
                    labelText: AppStrings.password,
                    errorText: _passwordErrorText,
                    controller: _passwordController,
                    onChange: (value) {
                      _signUpBloc.add(PasswordValidationEvent(password: value));
                    },
                  )),
              RoundedButton(
                  onTap: () {
                    _signUpBloc.add(FormValidationEvent(
                        name: _nameController.text,
                        password: _passwordController.text,
                        username: _usernameController.text));
                  },
                  title: AppStrings.signUp)
            ],
          ),
        ),
      ));
}

extension _SignUpStateAddition on _SignUpState {
  void _blocListener(BuildContext context, SignUpState state) {
    if (state is NameInvalidState) {
      _nameErrorText = state.errorMessage;
    }
    if (state is UsernameInvalidState) {
      _usernameErrorText = state.errorMessage;
    }
    if (state is PasswordInvalidState) {
      _passwordErrorText = state.errorMessage;
    }
    if (state is FormInvalidState) {
      _nameErrorText = state.nameErrorMessage;
      _passwordErrorText = state.passwordErrorMessage;
      _usernameErrorText = state.usernameErrorMessage;
    }
    if (state is NameValidatedState) {
      _nameErrorText = null;
    }
    if (state is UsernameValidatedState) {
      _usernameErrorText = null;
    }
    if (state is PasswordValidatedState) {
      _passwordErrorText = null;
    }
    if (state is FormValidationEvent) {
      _nameErrorText = null;
      _usernameErrorText = null;
      _passwordErrorText = null;
    }
  }
}
