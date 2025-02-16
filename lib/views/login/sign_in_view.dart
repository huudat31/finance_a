import 'package:finance_app/common_widget/primary_button.dart';
import 'package:finance_app/common_widget/round_textflied.dart';
import 'package:finance_app/common_widget/secondary_button.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:finance_app/views/login/sign_up_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    final medium = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Expanded(
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
                  title: 'Log in',
                  keyboardType: TextInputType.emailAddress,
                  controller: txtEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextFlied(
                  title: 'Password',
                  controller: txtPassword,
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isRemember = !isRemember;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isRemember == true
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              size: 25,
                              color: TColor.gray50,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: TColor.gray50,
                              ),
                            )
                          ],
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget your password',
                          style: TextStyle(color: TColor.gray50),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryButton(title: 'Sign in', onPressed: () {}),
                const SizedBox(height: 150),
                Text("If you don't have an account yet",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.white, fontSize: 14)),
                const SizedBox(height: 15),
                SecondaryButton(
                  title: 'Sign up',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()));
                  },
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
