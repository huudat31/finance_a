import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  const ImageButton({super.key, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: onPressed,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: TColor.border.withOpacity(.15)),
                  color: TColor.gray60.withOpacity(.2),
                  borderRadius: BorderRadius.circular(16)),
              alignment: Alignment.center,
              child: Image.asset(
                image,
                width: 50,
                height: 50,
                color: TColor.gray70,
              ),
            )));
  }
}
