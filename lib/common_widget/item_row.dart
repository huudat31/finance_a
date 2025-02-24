import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final String name;
  final String value;

  const ItemRow({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: TColor.gray30)),
          Spacer(),
          Text(
            value,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: TColor.gray30),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            'assets/img/next.png',
            width: 12,
            height: 12,
          )
        ],
      ),
    );
  }
}
