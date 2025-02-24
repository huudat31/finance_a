import 'package:finance_app/common_widget/icon_title_row.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray70,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
                            width: 20,
                            height: 20,
                            color: TColor.gray30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Setting',
                          style: TextStyle(
                              fontSize: 15,
                              color: TColor.gray30,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/u1.png',
                    width: 75,
                    height: 75,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Phan Huu Dich',
                      style: TextStyle(
                          fontSize: 20,
                          color: TColor.white,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'phanhuudat310708@gmail.com',
                      style: TextStyle(
                          fontSize: 13,
                          color: TColor.gray30,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    // TODO: Edit profile
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      border: Border.all(color: TColor.border.withOpacity(.2)),
                      borderRadius: BorderRadius.circular(10),
                      color: TColor.gray50,
                    ),
                    child: Text(
                      "Edit profile",
                      style: TextStyle(color: TColor.white),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        'General',
                        style: TextStyle(
                            fontSize: 15,
                            color: TColor.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: TColor.border.withOpacity(.1)),
                        borderRadius: BorderRadius.circular(16),
                        color: TColor.gray60.withOpacity(.2),
                      ),
                      child: Column(
                        children: [
                          IconTitleRow(
                            icon: 'assets/img/face_id.png',
                            name: 'Security',
                            value: 'FaceID',
                          ),
                          IconTitleSwitchRow(
                            icon: 'assets/img/icloud.png',
                            name: 'iCloud Sync',
                            value: isActive,
                            onChanged: (newValue) {
                              setState(() {
                                isActive = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ])),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        'My subcription',
                        style: TextStyle(
                            fontSize: 15,
                            color: TColor.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: TColor.border.withOpacity(.1)),
                        borderRadius: BorderRadius.circular(16),
                        color: TColor.gray60.withOpacity(.2),
                      ),
                      child: Column(
                        children: [
                          IconTitleRow(
                            icon: 'assets/img/sorting.png',
                            name: 'Sorting',
                            value: 'Date',
                          ),
                          IconTitleRow(
                            icon: 'assets/img/chart.png',
                            name: 'Summary',
                            value: 'Average',
                          ),
                          IconTitleRow(
                            icon: 'assets/img/money.png',
                            name: 'Default currency',
                            value: 'USD',
                          ),
                        ],
                      ),
                    ),
                  ])),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        'Appearance',
                        style: TextStyle(
                            fontSize: 15,
                            color: TColor.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: TColor.border.withOpacity(.1)),
                        borderRadius: BorderRadius.circular(16),
                        color: TColor.gray60.withOpacity(.2),
                      ),
                      child: Column(
                        children: [
                          IconTitleRow(
                            icon: 'assets/img/app_icon.png',
                            name: 'App icon',
                            value: 'Default',
                          ),
                          IconTitleRow(
                            icon: 'assets/img/light_theme.png',
                            name: 'Theme',
                            value: 'Dark',
                          ),
                          IconTitleRow(
                            icon: 'assets/img/font.png',
                            name: 'Font',
                            value: 'Intel',
                          ),
                        ],
                      ),
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
