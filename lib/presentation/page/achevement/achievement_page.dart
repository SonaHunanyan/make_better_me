import 'package:flutter/material.dart';
import 'package:make_better_me/domain/entity/achievement.dart';
import 'package:make_better_me/presentation/constant/constans.dart';
import 'package:make_better_me/presentation/extension/app_theme.dart';
import 'package:make_better_me/presentation/themes/app_colors.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage(this.achievement, {super.key});
  final Achievement achievement;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100 * grh(context)),
            child: Column(
              children: [
                Text(
                  achievement.title,
                  style: context.themeData.textTheme.headline2
                      ?.copyWith(color: AppColors.blue),
                ),
                Image.network(
                  achievement.image,
                  width: 200 * grw(context),
                  height: 200 * grw(context),
                ),
                Text(
                  achievement.description,
                  style: context.themeData.textTheme.bodyText2,
                )
              ],
            ),
          ),
        ));
  }
}
