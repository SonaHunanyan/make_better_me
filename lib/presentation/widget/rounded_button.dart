import 'package:flutter/material.dart';
import 'package:make_better_me/presentation/constant/constans.dart';
import 'package:make_better_me/presentation/extension/app_theme.dart';
import 'package:make_better_me/presentation/themes/app_colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.onTap, required this.title});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: 50 * grh(context),
          width: 200 * grw(context),
          decoration: BoxDecoration(
              color: AppColors.blue, borderRadius: BorderRadius.circular(10)),
          child: Text(
            title,
            style: context.themeData.textTheme.bodyText1
                ?.copyWith(color: Colors.white),
          )),
    );
  }
}
