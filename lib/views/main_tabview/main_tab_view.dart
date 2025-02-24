import 'package:finance_app/commons/color_extension.dart';
import 'package:finance_app/views/add_subscription/add_subscription.dart';
import 'package:finance_app/views/calenders/calender_view.dart';
import 'package:finance_app/views/cards/card_view.dart';
import 'package:finance_app/views/homes/home_view.dart';
import 'package:finance_app/views/spending_budgets/spending_budgets_view.dart';

import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentPage = HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray50,
      body: SafeArea(
        child: Stack(
          children: [
            PageStorage(bucket: pageStorageBucket, child: currentPage),
            Column(
              children: [
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Stack(
                        children: [
                          Image.asset('assets/img/bottom_bar_bg.png'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTab = 0;
                                      currentPage = HomeView();
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/img/home.png',
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 0
                                        ? TColor.white
                                        : TColor.gray30,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTab = 1;
                                      currentPage = SpendingBudgetsView();
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/img/budgets.png',
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 1
                                        ? TColor.white
                                        : TColor.gray30,
                                  )),
                              const SizedBox(
                                width: 50,
                                height: 50,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTab = 2;
                                      currentPage = CalenderView();
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/img/calendar.png',
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 2
                                        ? TColor.white
                                        : TColor.gray30,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTab = 3;
                                      currentPage = CardView();
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/img/creditcards.png',
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 3
                                        ? TColor.white
                                        : TColor.gray30,
                                  ))
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddSubscription())),
                        child: Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(.5),
                                blurRadius: 10,
                                offset: Offset(0, 4))
                          ], borderRadius: BorderRadius.circular(55)),
                          child: Image.asset(
                            'assets/img/center_btn.png',
                            width: 55,
                            height: 55,
                          ),
                        ),
                      )
                    ])),
              ],
            )
          ],
        ),
      ),
    );
  }
}
