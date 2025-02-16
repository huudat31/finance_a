import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class RoundTextFlied extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  const RoundTextFlied(
      {super.key,
      required this.title,
      this.controller,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            // textAlign: TextAlign.center,
            style: TextStyle(color: TColor.gray50, fontSize: 14)),
        const SizedBox(height: 5),
        Container(
          height: 48,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: TColor.gray60.withOpacity(.2),
            border: Border.all(color: TColor.gray70),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
            keyboardType: keyboardType,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
