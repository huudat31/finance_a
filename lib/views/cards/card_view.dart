import 'package:card_swiper/card_swiper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:finance_app/common_widget/subscription_cell.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:finance_app/views/settings/setting_view.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
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
  List cardArr = [
    {
      "name": "Phan Huu Dich",
      "number": "**** **** **** 2456",
      "month_day": "08/27",
    },
    {
      "name": "Luu Thi Dao",
      "number": "**** **** **** 2389",
      "month_day": "08/27",
    },
    {
      "name": "Phan Huu Dai",
      "number": "**** **** **** 4784",
      "month_day": "08/27",
    },
    {
      "name": "Phan Huu Dat",
      "number": "**** **** **** 8764",
      "month_day": "08/27",
    },
    {
      "name": "Phan Bao Ngoc",
      "number": "**** **** **** 7685",
      "month_day": "08/27",
    },
  ];
  SwiperController swiperController = SwiperController();
  Widget buildSwiper() {
    return Swiper(
      itemCount: cardArr.length,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
        ..addRotate([-45 / 180, 0, 45 / 180])
        ..addTranslate(
            [const Offset(-370, -40), Offset.zero, const Offset(370, -40)]),
      fade: 1,
      scale: .8,
      controller: swiperController,
      onIndexChanged: (index) => print(index),
      itemWidth: 232,
      itemHeight: 350,
      layout: SwiperLayout.STACK,
      itemBuilder: (context, index) {
        var bObj = cardArr[index] as Map? ?? {};
        return Container(
          decoration: BoxDecoration(
            color: TColor.gray70,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/img/card_blank.png',
                width: 232,
                height: 350,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    'assets/img/mastercard_logo.png',
                    width: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Virtual Card',
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 125,
                  ),
                  Text(bObj['name'] ?? '',
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(bObj['number'] ?? '',
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(bObj['month_day'] ?? '',
                      style: TextStyle(
                          color: TColor.gray20,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),
        );
      },
      axisDirection: AxisDirection.right,
      autoplayDisableOnInteraction: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: TColor.gray,
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: 600,
                child: buildSwiper(),
              ),
              Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Creadit card',
                                  style: TextStyle(
                                      color: TColor.gray30,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingView()));
                              },
                              icon: Image.asset(
                                'assets/img/settings.png',
                                width: 25,
                                height: 25,
                                color: TColor.gray30,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 420,
                  ),
                  Text('Subcriptions',
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: subArr.map((sObj) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Image.asset(
                          sObj['icon'],
                          width: 40,
                          height: 40,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      color: TColor.gray70.withOpacity(.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 23),
                          child: InkWell(
                              onTap: () {},
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                dashPattern: [5, 5],
                                color: TColor.border.withOpacity(.2),
                                strokeWidth: 1,
                                radius: Radius.circular(20),
                                child: Container(
                                  height: 50,
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
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
