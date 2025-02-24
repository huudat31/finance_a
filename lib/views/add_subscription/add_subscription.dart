import 'package:carousel_slider/carousel_slider.dart';
import 'package:finance_app/common_widget/image_button.dart';
import 'package:finance_app/common_widget/primary_button.dart';
import 'package:finance_app/common_widget/round_textflied.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:finance_app/views/homes/home_view.dart';
import 'package:finance_app/views/main_tabview/main_tab_view.dart';
import 'package:finance_app/views/subcription_info/subcription_info_view.dart';
import 'package:flutter/material.dart';

class AddSubscription extends StatefulWidget {
  const AddSubscription({super.key});

  @override
  State<AddSubscription> createState() => _AddSubscriptionState();
}

class _AddSubscriptionState extends State<AddSubscription> {
  TextEditingController amountController = TextEditingController();
  TextEditingController txtController = TextEditingController();
  List subArr = [
    {
      "name": "HBO GO",
      "icon": "assets/img/hbo_logo.png",
    },
    {
      "name": "Spotify",
      "icon": "assets/img/spotify_logo.png",
    },
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
    },
    {
      "name": "NetFlix",
      "icon": "assets/img/netflix_logo.png",
    }
  ];
  double amountValue = .09;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset(
                                  'assets/img/back.png',
                                  width: 25,
                                  height: 25,
                                  color: TColor.gray30,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'new',
                                style: TextStyle(
                                    fontSize: 15, color: TColor.gray30),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'ADD NEW\nSUBSCRIPTION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40,
                            color: TColor.gray30,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: media.width * .6,
                      width: media.width,
                      child: CarouselSlider.builder(
                        itemCount: subArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var sObj = subArr[itemIndex] as Map? ?? {};
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset(
                                  sObj['icon'] ?? '',
                                  width: media.width * .4,
                                  height: media.width * .4,
                                  fit: BoxFit.fitHeight,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  sObj['name'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: TColor.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                            aspectRatio: 1,
                            viewportFraction: 0.65,
                            enableInfiniteScroll: true,
                            autoPlay: false,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            enlargeFactor: .4,
                            enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RoundTextFlied(
                title: 'Description',
                controller: txtController,
                titleAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    child: ImageButton(
                      image: "assets/img/minus.png",
                      onPressed: () {
                        amountValue -= .01;
                        if (amountValue < 0) {
                          amountValue = 0;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Monthly price',
                        style: TextStyle(
                            fontSize: 12,
                            color: TColor.gray30,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${amountValue.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 30,
                            color: TColor.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(
                      width: 50,
                      child: ImageButton(
                          image: "assets/img/plus.png",
                          onPressed: () {
                            amountValue += .01;
                            setState(() {});
                          }))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: PrimaryButton(
                  title: 'Add this plaform',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainTabView();
                    }));
                  }),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
