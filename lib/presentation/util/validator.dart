import 'package:make_better_me/presentation/themes/app_strings.dart';
import 'package:make_better_me/presentation/util/rep_exp.dart';

class Validators {
  static String? verificationCodeValidators(String value) {
    if (value.length < 4) {
      return AppStrings.verificationCodeError;
    }
    return null;
  }

  static String? emptyValidators(String value) {
    if (value.isEmpty) {
      return AppStrings.valueRequired;
    }
    return null;
  }

  static String? emailValidator(String value) {
    final val = emptyValidators(value);
    if (val != null) {
      return val;
    }
    if (!value.contains(RegExp(emailRegExp))) {
      return AppStrings.invalidEmail;
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
