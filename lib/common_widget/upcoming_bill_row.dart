import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class UpcomingBillRow extends StatelessWidget {
  final Map subBills;

  final VoidCallback onPressed;
  const UpcomingBillRow(
      {super.key, required this.subBills, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 64,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: TColor.border.withOpacity(.15)),
                color: TColor.gray60.withOpacity(.2),
                borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 40,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: TColor.gray70.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Jun',
                        style: TextStyle(
                            color: TColor.gray30,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Text(
                          '25',
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    subBills['name'],
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '\$${subBills["price"]}',
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )),
    );
  }
}
