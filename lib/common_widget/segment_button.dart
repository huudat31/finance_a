import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class SegmentButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onPressed;
  const SegmentButton(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: onPressed,
            child: Container(
              decoration: isActive
                  ? BoxDecoration(
                      border: Border.all(color: TColor.border.withOpacity(.15)),
                      color: TColor.gray60.withOpacity(.2),
                      borderRadius: BorderRadius.circular(15))
                  : null,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: isActive ? TColor.white : TColor.gray30,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            )));
  }
}
