import 'package:flutter/material.dart';
import 'app_colors.dart';

final base = ThemeData.light();

final lightTheme = base.copyWith(
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: base.inputDecorationTheme.copyWith(
    labelStyle: const TextStyle(
        color: AppColors.lightGrey,
        fontWeight: FontWeight.w400,
        fontSize: 11,
        height: 1.1),
  ),
  textTheme: base.primaryTextTheme.copyWith(
    headline1: base.primaryTextTheme.headline1!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
    headline2: base.primaryTextTheme.headline2!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.bold,
      fontSize: 38,
      letterSpacing: -.76,
      height: 1,
    ),
    headline3: base.primaryTextTheme.headline3!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.bold,
      fontSize: 28,
      letterSpacing: -.56,
      height: 1,
    ),
    headline4: base.primaryTextTheme.headline4!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.normal,
      fontSize: 26,
      letterSpacing: -.52,
      height: 1,
    ),
    headline5: base.primaryTextTheme.headline5!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.w500,
      fontSize: 17,
      height: 1.2,
    ),
    headline6: base.primaryTextTheme.headline6!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.w400,
      fontSize: 18,
      letterSpacing: -.4,
      height: 1.1,
    ),
    subtitle1: base.primaryTextTheme.subtitle1!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      height: 1.25,
      letterSpacing: -.32,
    ),
    subtitle2: base.primaryTextTheme.subtitle2!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.w400,
      fontSize: 13,
      height: 1.25,
      letterSpacing: -.32,
    ),
    bodyText1: base.primaryTextTheme.bodyText1!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: -.32,
      height: 1.25,
    ),
    bodyText2: base.primaryTextTheme.bodyText2!.copyWith(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: -.16,
      height: 1.25,
    ),
    caption: const TextStyle(
      color: AppColors.quickSilver,
      fontWeight: FontWeight.normal,
      fontSize: 12,
      height: 1.1,
      letterSpacing: -.16,
    ),
    overline: const TextStyle(
      color: AppColors.darkPurple,
      fontWeight: FontWeight.w400,
      fontSize: 10,
      height: 1.1,
      letterSpacing: -.1,
    ),
    button: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 15,
      height: 1.1,
    ),
  ),
);
