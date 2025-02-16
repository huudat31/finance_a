import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontsize;
  final FontWeight fontWeight;
  const SecondaryButton(
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
          image:
              DecorationImage(image: AssetImage('assets/img/secodry_btn.png')),
        ),
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
