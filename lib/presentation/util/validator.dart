import 'package:make_better_me/presentation/themes/app_strings.dart';

class Validators {
  static String? emptyValidators(String value) {
    if (value.isEmpty) {
      return AppStrings.valueRequired;
    }
    return null;
  }

  static String? passwordValidators(String value) {
    final val = emptyValidators(value);
    if (val != null) {
      return val;
    }
    return null;
  }

  static String? repeatPasswordValidators(String value, String password) {
    final val = emptyValidators(value);
    if (val != null) {
      return val;
    }
    if (value != password) {
      return AppStrings.passwordDidNotMatch;
    }
    return null;
  }
}
