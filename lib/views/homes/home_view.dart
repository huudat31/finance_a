import 'package:finance_app/common_widget/custom_arc_painter.dart';
import 'package:finance_app/common_widget/segment_button.dart';
import 'package:finance_app/common_widget/status_button.dart';
import 'package:finance_app/common_widget/subscription_view_row.dart';
import 'package:finance_app/common_widget/upcoming_bill_row.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:finance_app/views/subcription_info/subcription_info_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;
  List subArr = [
    {
      "name": "Spotify",
      "icon": "assets/img/spotify_logo.png",
      "price": "3.99",
    },
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "89.99",
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "34.45",
    },
    {
      "name": "NetFlix",
      "icon": "assets/img/netflix_logo.png",
      "price": "14.99",
    }
  ];
  List subBills = [
    {
      "name": "Spotify",
      "date": DateTime(2025, 02, 25),
      "price": "3.99",
    },
    {
      "name": "YouTube Premium",
      "date": DateTime(2025, 02, 25),
      "price": "89.99",
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2025, 02, 25),
      "price": "34.45",
    },
    {
      "name": "NetFlix",
      "date": DateTime(2025, 02, 25),
      "price": "14.99",
    }
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/img/home_bg.png'),
                  Container(
                    padding: EdgeInsets.only(bottom: media.width * .1),
                    width: media.width * .72,
                    height: media.width * .72,
                    child: CustomPaint(
                      painter: CustomArcPainter(end: 220),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/img/app_logo.png',
                        width: media.width * 0.25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('\$1.234',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: TColor.white)),
                      SizedBox(
                        height: 15,
                      ),
                      Text('This month',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: TColor.gray40)),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: TColor.border.withOpacity(.15)),
                                color: TColor.gray60.withOpacity(.3),
                                borderRadius: BorderRadius.circular(18)),
                            child: Text(
                              'See your budget',
                              style: TextStyle(
                                  color: TColor.gray30,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                                child: StatusButton(
                              title: 'Active Subs',
                              value: '12',
                              statusColor: TColor.secondary,
                              onPressed: () {},
                            )),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: StatusButton(
                              title: 'Highest Subs',
                              value: '\$19.99',
                              statusColor: TColor.primary10,
                              onPressed: () {},
                            )),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: StatusButton(
                              title: 'Lowest Subs',
                              value: '\$5.99',
                              statusColor: TColor.secondaryG,
                              onPressed: () {},
                            )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                      child: SegmentButton(
                          title: 'Your Subscription',
                          isActive: isSubscription,
                          onPressed: () {
                            setState(() {
                              isSubscription = !isSubscription;
                            });
                          })),
                  Expanded(
                      child: SegmentButton(
                          title: 'Upcoming bills',
                          isActive: !isSubscription,
                          onPressed: () {
                            setState(() {
                              isSubscription = !isSubscription;
                            });
                          }))
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                itemCount: subArr.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var sObj = subArr[index] as Map? ?? {};
                  return Column(
                    children: [
                      SubscriptionViewRow(
                          sObj: sObj,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SubcriptionInfoView(
                                sObj: sObj,
                              );
                            }));
                          })
                    ],
                  );
                },
              ),
            if (!isSubscription)
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                itemCount: subArr.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var subBill = subBills[index] as Map? ?? {};
                  return Column(
                    children: [
                      UpcomingBillRow(subBills: subBill, onPressed: () {})
                    ],
                  );
                },
              ),
            SizedBox(
              height: 110,
            )
          ],
        ),
      ),
    );
  }
}
