import 'package:dotted_border/dotted_border.dart';
import 'package:finance_app/common_widget/budget_row.dart';
import 'package:finance_app/common_widget/custom_arc_painter_spend.dart';

import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class SpendingBudgetsView extends StatefulWidget {
  const SpendingBudgetsView({super.key});

  @override
  State<SpendingBudgetsView> createState() => _SpendingBudgetsViewState();
}

class _SpendingBudgetsViewState extends State<SpendingBudgetsView> {
  bool isSubscription = true;
  List budgetArr = [
    {
      "name": "Auto & Transport",
      "icon": "assets/img/auto_&_transport.png",
      "spend_amount": "23.99",
      "total_budget": '401',
      "left_amount": "259.99",
      "color": TColor.secondaryG,
    },
    {
      "name": "Entertainment",
      "icon": "assets/img/entertainment.png",
      "spend_amount": "33.99",
      "total_budget": '301',
      "left_amount": "200.99",
      "color": TColor.secondary50,
    },
    {
      "name": "Security",
      "icon": "assets/img/security.png",
      "spend_amount": "53.99",
      "total_budget": '281',
      "left_amount": "220.99",
      "color": TColor.primary10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: media.width * .5,
                  height: media.width * .25,
                  child: CustomPaint(
                    painter: CustomArcPainterSpend(
                        end: 50,
                        drawAr: [
                          ArcValueModel(color: TColor.secondaryG, value: 30),
                          ArcValueModel(color: TColor.secondary, value: 50),
                          ArcValueModel(color: TColor.primary10, value: 70),
                        ],
                        width: 12,
                        bgwidth: 8),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '\$83,67',
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'of \$2.000 budgets',
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 64,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: TColor.border.withOpacity(.15)),
                        color: TColor.gray60.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your budget are on tack',
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )),
            ),
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              itemCount: budgetArr.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var bObj = budgetArr[index] as Map? ?? {};
                return Column(
                  children: [BudgetRow(bObj: bObj, onPressed: () {})],
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: InkWell(
                  onTap: () {},
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [5, 5],
                    color: TColor.border.withOpacity(.2),
                    strokeWidth: 1,
                    radius: Radius.circular(20),
                    child: Container(
                      height: 64,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add new category ',
                            style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Image.asset(
                            'assets/img/add.png',
                            width: 12,
                            height: 12,
                            color: TColor.gray30,
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
