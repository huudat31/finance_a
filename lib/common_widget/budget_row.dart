import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class BudgetRow extends StatelessWidget {
  final Map bObj;

  final VoidCallback onPressed;
  const BudgetRow({super.key, required this.bObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var proVal = (double.tryParse(bObj['left_amount']) ?? 0) /
        (double.tryParse(bObj['total_budget']) ?? 0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: TColor.border.withOpacity(.05)),
                color: TColor.gray60.withOpacity(.1),
                borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Image.asset(
                      bObj['icon'],
                      width: 35,
                      height: 35,
                      color: TColor.gray40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bObj['name'],
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "\$${bObj['left_amount']} left to spend",
                            style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${bObj['spend_amount']}",
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          " of \$${bObj['total_budget']} ",
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                LinearProgressIndicator(
                  backgroundColor: TColor.gray60,
                  minHeight: 3,
                  color: bObj['color'],
                  value: proVal,
                )
              ],
            ),
          )),
    );
  }
}
