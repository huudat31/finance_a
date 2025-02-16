import 'package:finance_app/common_widget/primary_button.dart';
import 'package:finance_app/common_widget/round_textflied.dart';
import 'package:finance_app/common_widget/secondary_button.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:finance_app/views/login/sign_in_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var medium = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
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
              RoundTextFlied(
                title: 'Email address',
                keyboardType: TextInputType.emailAddress,
                controller: txtEmail,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundTextFlied(
                title: 'Password',
                controller: txtEmail,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 5,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: TColor.gray60,
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 5,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: TColor.gray60,
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 5,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: TColor.gray60,
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 5,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: TColor.gray60,
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      'Use 8 or more characters with a mix of letters, \nnumbers & symbols',
                      // textAlign: TextAlign.center,
                      style: TextStyle(color: TColor.gray50, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 15),
              PrimaryButton(title: "Get started, It's free", onPressed: () {}),
              const SizedBox(height: 150),
              Text('Do you have already an account',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.white, fontSize: 14)),
              const SizedBox(height: 15),
              SecondaryButton(
                title: 'Sign in',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()));
                },
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
