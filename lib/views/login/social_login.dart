import 'package:finance_app/common_widget/secondary_button.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:finance_app/views/login/sign_up_view.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({super.key});

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    var medium = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/app_logo.png',
              width: medium.width * 0.5,
              fit: BoxFit.contain,
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/apple_btn.png'),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.5),
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ]),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/apple.png',
                        width: 15,
                        height: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign up with Apple',
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/google_btn.png')),
                      boxShadow: [
                        BoxShadow(
                            color: TColor.white.withOpacity(.5),
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ]),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/google.png',
                        width: 15,
                        height: 15,
                        color: TColor.gray,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign up with Google',
                        style: TextStyle(
                            color: TColor.gray,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/fb_btn.png')),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue.withOpacity(.5),
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ]),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/fb.png',
                        width: 15,
                        height: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign up with Facebook',
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 35),
            Text('or',
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.white, fontSize: 16)),
            const SizedBox(height: 35),
            SecondaryButton(
              title: 'Sign up with Gmail',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpView()));
              },
            ),
            const SizedBox(height: 35),
            Text(
                'By registering, you agree to our\nTerms of Service and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.white, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
