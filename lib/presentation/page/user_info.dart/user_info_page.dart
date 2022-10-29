import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_better_me/data/repository/achievement_repository.dart';
import 'package:make_better_me/domain/entity/achievement.dart';
import 'package:make_better_me/domain/entity/user.dart';
import 'package:make_better_me/presentation/constant/constans.dart';
import 'package:make_better_me/presentation/mixin/state_addition_mixin.dart';
import 'package:make_better_me/presentation/modal/error_dialog.dart';
import 'package:make_better_me/presentation/page/achevement/achievement_page.dart';
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

class _UserInfoState extends State<UserInfoPage> with StateAddition {
  User get _user => widget.user;

  final _userInfoBloc =
      UserInfoBloc(achievementRepository: AchievementRepository());
  var _steps = 0;
  var _isLoading = true;
  var _achievements = <Achievement>[];

  @override
  void initState() {
    _userInfoBloc
      ..add(GetStepsEvent())
      ..add(GetAchievements());
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
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30 * grh(context)),
                    child: Column(
                      children: [
                        _renderLogOut,
                        Padding(
                            padding: EdgeInsets.only(top: 50 * grh(context)),
                            child: Text(
                              AppStrings.steps,
                              style: context.themeData.textTheme.headline2
                                  ?.copyWith(color: AppColors.blue),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 10 * grh(context)),
                          child: Text(
                            _steps.toString(),
                            style: context.themeData.textTheme.headline1,
                          ),
                        ),
                        _renderAchievements
                      ],
                    ),
                  ),
                )));

  Widget get _renderLogOut => Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: Text(
          AppStrings.logOut,
          style: context.themeData.textTheme.bodyText2,
        ),
      ));

  Widget get _renderLoadingIndicator => Container(
        alignment: Alignment.center,
        height: 100 * grw(context),
        width: 100 * grw(context),
        child: const CircularProgressIndicator(color: AppColors.darkPurple),
      );

  Widget get _renderAchievements => Wrap(
        children: _achievements
            .map((e) => Padding(
                  padding: EdgeInsets.all(10 * grw(context)),
                  child: _renderAchievement(e),
                ))
            .toList(),
      );

  Widget _renderAchievement(Achievement achievement) {
    final isGreyOut = !_user.achievementsId.contains(achievement.id);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AchievementPage(achievement)));
        },
        child: Container(
            alignment: Alignment.center,
            height: 200 * grh(context),
            decoration: BoxDecoration(
                border: Border.all(
                    color: isGreyOut ? AppColors.grey : AppColors.blue),
                borderRadius: BorderRadius.circular(20)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    achievement.title,
                    style: context.themeData.textTheme.headline1?.copyWith(
                        color: isGreyOut ? AppColors.grey : AppColors.blue),
                  ),
                  isGreyOut
                      ? const SizedBox()
                      : const Icon(
                          Icons.verified,
                          color: AppColors.blue,
                        )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10 * grh(context)),
                  child: Image.network(
                    achievement.image,
                    width: 100 * grw(context),
                    height: 100 * grw(context),
                  ))
            ])));
  }
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
    if (state is AchievementsLoadedSuccessfuly) {
      _achievements = state.achievements;
    }
    if (state is FailToLoadAchievements) {
      showErrorDialog(context);
    }
  }
}
