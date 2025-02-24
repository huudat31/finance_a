import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTitleRow extends StatelessWidget {
  final String name;
  final String icon;
  final String value;

  const IconTitleRow({
    Key? key,
    required this.name,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            icon,
            width: 20,
            height: 20,
            color: TColor.gray20,
          ),
          SizedBox(
            width: 8,
          ),
          Text(name,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: TColor.white)),
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

class IconTitleSwitchRow extends StatelessWidget {
  final String name;
  final String icon;
  final bool value;
  final Function(bool) onChanged;

  const IconTitleSwitchRow({
    Key? key,
    required this.name,
    required this.value,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            icon,
            width: 20,
            height: 20,
            color: TColor.gray20,
          ),
          SizedBox(
            width: 8,
          ),
          Text(name,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: TColor.white)),
          Spacer(),
          SizedBox(
            width: 10,
          ),
          CupertinoSwitch(value: value, onChanged: onChanged)
        ],
      ),
    );
  }
}
