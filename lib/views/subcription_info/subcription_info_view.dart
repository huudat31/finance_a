import 'package:finance_app/common_widget/item_row.dart';
import 'package:finance_app/commons/color_extension.dart';
import 'package:flutter/material.dart';

class SubcriptionInfoView extends StatefulWidget {
  final Map sObj;
  const SubcriptionInfoView({super.key, required this.sObj});

  @override
  State<SubcriptionInfoView> createState() => _SubcriptionInfoViewState();
}

class _SubcriptionInfoViewState extends State<SubcriptionInfoView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff282833)),
                  borderRadius: BorderRadius.circular(24)),
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: media.width * .9,
                    decoration: BoxDecoration(
                      color: TColor.gray70,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Image.asset(
                                'assets/img/dorp_down.png',
                                width: 20,
                                height: 20,
                                color: TColor.gray30,
                              ),
                            ),
                            Text(
                              'Subscription Info',
                              style:
                                  TextStyle(fontSize: 15, color: TColor.gray30),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/img/Trash.png',
                                width: 20,
                                height: 20,
                                color: TColor.gray30,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        if (widget.sObj['icon'] != null)
                          Image.asset(
                            widget.sObj['icon'],
                            width: media.width * .25,
                            height: media.width * .25,
                          )
                        else
                          SizedBox(
                            width: media.width * .25,
                            height: media.width * .25,
                          ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.sObj['name'] ?? 'Unknown',
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          '\$${widget.sObj["price"] ?? '0.00'}',
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Container(
                      height: media.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: TColor.gray60.withOpacity(.2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24)),
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: TColor.border.withOpacity(.1)),
                            color: TColor.gray60.withOpacity(.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            ItemRow(
                              name: 'Name',
                              value: widget.sObj['name'],
                            ),
                            ItemRow(
                              name: 'Description',
                              value: 'Music app',
                            ),
                            ItemRow(
                              name: 'Category',
                              value: 'Entertainment',
                            ),
                            ItemRow(
                              name: 'First Payment',
                              value: '08.07.2025',
                            ),
                            ItemRow(
                              name: 'Reminder',
                              value: 'Newer',
                            ),
                            ItemRow(
                              name: 'Currency',
                              value: 'USD',
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
