import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontsize;
  final FontWeight fontWeight;
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.fontsize = 14,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/primary_btn.png')),
            boxShadow: [
              BoxShadow(
                  color: TColor.secondary.withOpacity(.5),
                  blurRadius: 15,
                  offset: Offset(0, 7))
            ]),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: TColor.white, fontSize: fontsize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
