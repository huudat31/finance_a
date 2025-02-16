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
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: TColor.border.withOpacity(.15)),
              color: TColor.gray60.withOpacity(.2),
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          child: Row(
            children: [
              Image.asset(
                sObj['icon'],
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  sObj['name'],
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '\$${sObj["price"]}',
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ));
  }
}
