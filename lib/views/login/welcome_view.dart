import 'package:finance_app/common_widget/primary_button.dart';
import 'package:finance_app/common_widget/secondary_button.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:finance_app/views/login/sign_in_view.dart';
import 'package:finance_app/views/login/social_login.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var medium = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset('assets/img/welcome_screen.png',
            fit: BoxFit.cover, height: medium.height, width: medium.width),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/app_logo.png',
                width: medium.width * 0.5,
                fit: BoxFit.contain,
              ),
              Spacer(),
              Text('Tiện lợi, Công bằng,  An toàn',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.white, fontSize: 16)),
              const SizedBox(height: 30),
              PrimaryButton(
                title: 'Get Started',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SocialLogin()));
                },
              ),
              const SizedBox(height: 5),
              SecondaryButton(
                title: 'I have an account',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()));
                },
              ),
            ],
          ),
        ))
      ],
    );
  }
}
