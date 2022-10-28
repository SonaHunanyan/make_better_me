import 'package:flutter/material.dart';
import 'package:make_better_me/presentation/constant/constans.dart';
import 'package:make_better_me/presentation/extension/app_theme.dart';
import 'package:make_better_me/presentation/themes/app_strings.dart';

showErrorDialog(
  BuildContext context, {
  String message = AppStrings.somethingWentWrong,
}) async {
  await showDialog(
      context: context,
      builder: (_) {
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 100 * grh(context),
            child: Material(
              child: Center(
                child: Text(
                  message,
                  style: context.themeData.textTheme.headline1,
                ),
              ),
            ),
          ),
        );
      });
}
