import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:finance_app/common_widget/subscription_cell.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:finance_app/views/settings/setting_view.dart';
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
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  CalendarAgendaController _calendarAgendaControllerNotAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  late DateTime _selectedDateNotAppBBar;

  Random random = new Random();

  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
    _selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: TColor.gray,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: TColor.gray70.withOpacity(.5),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Calender',
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
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 15),
                        child: Row(
                          children: [
                            Text('Sub\nScheduled',
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('3 subscriptions for day',
                                  style: TextStyle(
                                      color: TColor.gray30,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: TColor.gray60,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'February',
                                        style: TextStyle(
                                            color: TColor.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.expand_more,
                                        color: TColor.white,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                      ),
                      CalendarAgenda(
                        controller: _calendarAgendaControllerAppBar,
                        appbar: true,
                        backgroundColor: Colors.transparent,
                        selectedDayPosition: SelectedDayPosition.right,
                        weekDay: WeekDay.long,
                        fullCalendarScroll: FullCalendarScroll.horizontal,
                        fullCalendarDay: WeekDay.long,
                        selectedDateColor: Colors.green.shade900,
                        dateColor: Colors.white,
                        locale: 'en',
                        initialDate: DateTime.now(),
                        calendarEventColor: Colors.green,
                        firstDate: DateTime.now().subtract(Duration(days: 140)),
                        lastDate: DateTime.now().add(Duration(days: 140)),
                        events: List.generate(
                            100,
                            (index) => DateTime.now().subtract(
                                Duration(days: index * random.nextInt(5)))),
                        onDateSelected: (date) {
                          setState(() {
                            _selectedDateAppBBar = date;
                          });
                        },
                        // Increase the padding between days
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('February',
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        Text('\$2.00',
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('01.08.2025',
                            style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                        Text('in upcoming bills ',
                            style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 13,
                                fontWeight: FontWeight.w500)),
                      ],
                    )
                  ],
                ),
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subArr.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1),
                  itemBuilder: (context, index) {
                    var sObj = subArr[index] as Map? ?? {};
                    return SubscriptionCell(sObj: sObj, onPressed: () {});
                  }),
              SizedBox(
                height: 110,
              )
            ],
          ),
        ));
  }
}
