import 'package:finance_app/common_widget/subscription_cell.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
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

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: TColor.gray,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: media.width * 1.1,
            decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(.5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Stack(
              alignment: Alignment.center,
              children: [],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'January',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: TColor.white),
                    ),
                    Text(
                      '\$12,45',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: TColor.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '01.08.2025',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: TColor.gray30),
                    ),
                    Text(
                      'in upcoming bills',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: TColor.gray30),
                    )
                  ],
                )
              ],
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              var sObj = subArr[index] as Map? ?? {};
              return SubscriptionCell(
                sObj: sObj,
                onPressed: () {},
              );
            },
          )
        ])));
  }
}
