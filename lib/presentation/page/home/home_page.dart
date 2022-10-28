import 'package:flutter/material.dart';
import 'package:make_better_me/presentation/constant/constans.dart';
import 'package:make_better_me/presentation/page/sign_up/sign_up_page.dart';
import 'package:make_better_me/presentation/themes/app_strings.dart';
import 'package:make_better_me/presentation/widget/rounded_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedButton(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SignUpPage()));
            },
            title: AppStrings.signUp,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 10 * grh(context)),
            child: RoundedButton(
              onTap: () {},
              title: AppStrings.logIn,
            ),
          )
        ],
      )),
    );
  }
}
