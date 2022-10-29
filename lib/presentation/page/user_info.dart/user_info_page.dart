import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_better_me/domain/entity/user.dart';
import 'package:make_better_me/presentation/constant/constans.dart';
import 'package:make_better_me/presentation/modal/error_dialog.dart';
import 'package:make_better_me/presentation/page/user_info.dart/bloc/user_info_bloc.dart';
import 'package:make_better_me/presentation/page/user_info.dart/bloc/user_info_event.dart';
import 'package:make_better_me/presentation/page/user_info.dart/bloc/user_info_state.dart';
import 'package:make_better_me/presentation/themes/app_colors.dart';
import 'package:make_better_me/presentation/themes/app_strings.dart';
import 'package:make_better_me/presentation/extension/app_theme.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key, required this.user});

  final User user;

  @override
  State<StatefulWidget> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfoPage> {
  final _userInfoBloc = UserInfoBloc();
  var _steps = 0;
  var _isLoading = true;

  @override
  void initState() {
    _userInfoBloc.add(GetStepsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _userInfoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserInfoBloc>(
        create: (context) => _userInfoBloc,
        child: BlocListener<UserInfoBloc, UserInfoState>(
          listener: _blocListener,
          child: BlocBuilder<UserInfoBloc, UserInfoState>(
              builder: (context, state) => _render),
        ));
  }

  Widget get _render => Scaffold(
          body: Center(
        child: _isLoading
            ? _renderLoadingIndicator
            : Padding(
                padding: EdgeInsets.only(top: 150 * grh(context)),
                child: Column(
                  children: [
                    Text(
                      AppStrings.steps,
                      style: context.themeData.textTheme.headline2
                          ?.copyWith(color: AppColors.blue),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10 * grh(context)),
                      child: Text(
                        _steps.toString(),
                        style: context.themeData.textTheme.headline1,
                      ),
                    )
                  ],
                ),
              ),
      ));

  Widget get _renderLoadingIndicator => Container(
        alignment: Alignment.center,
        height: 100 * grw(context),
        width: 100 * grw(context),
        child: const CircularProgressIndicator(color: AppColors.darkPurple),
      );
}

extension _UserInfoStateAddition on _UserInfoState {
  void _blocListener(BuildContext context, UserInfoState state) {
    if (state is FailToLoadSteps) {
      _isLoading = false;
      showErrorDialog(context);
    }
    if (state is StepsLoadedSuccessfuly) {
      _steps = state.stepsCount;
      _isLoading = false;
    }
  }
}
