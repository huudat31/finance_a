import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class SubscriptionCell extends StatelessWidget {
  final Map sObj;

  final VoidCallback onPressed;
  const SubscriptionCell(
      {super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(color: TColor.border.withOpacity(.1)),
              color: TColor.gray60.withOpacity(.2),
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (sObj['icon'] != null)
                Image.asset(
                  sObj['icon'],
                  width: 45,
                  height: 45,
                )
              else
                SizedBox(
                  width: 40,
                  height: 40,
                ),
              Spacer(),
              Text(
                sObj['name'] ?? 'Unknown',
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '\$${sObj["price"] ?? '0.00'}',
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ));
  }
}
