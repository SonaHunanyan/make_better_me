import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:make_better_me/presentation/constant/constans.dart';
import 'package:make_better_me/presentation/extension/app_theme.dart';
import 'package:make_better_me/presentation/themes/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      this.controller,
      this.labelText,
      this.errorText,
      this.keyboardType,
      this.onChange,
      this.inputFormatters,
      this.obscureText = false})
      : super(key: key);
  final TextEditingController? controller;
  final String? labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context),
        TextField(
            inputFormatters: inputFormatters,
            onChanged: onChange,
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(
                color: AppColors.darkPurple,
                fontSize: 13,
                fontWeight: FontWeight.w400),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              errorText: errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.brightGrey),
              ),
            )),
      ],
    );
  }

  Widget _label(BuildContext context) {
    if (labelText == null) {
      return const SizedBox();
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 6 * grh(context)),
      child: Text(labelText!,
          style: context.themeData.inputDecorationTheme.labelStyle),
    );
  }
}
