import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shift_project/styles/colors.dart';
import 'package:shift_project/styles/font.dart';

import 'models/shift_response_model.dart';
import 'styles/shift_details_page.dart';

class ShiftPage extends StatefulWidget {
  const ShiftPage({Key? key}) : super(key: key);

  @override
  State<ShiftPage> createState() => _ShiftPageState();
}

class _ShiftPageState extends State<ShiftPage> {
  ShiftResponse shiftResponse = ShiftResponse();
  List<Shift> acceptedShifts = [];
  List<Shift> incomingShifts = [];

  Future<ShiftResponse> _loadShiftAsset() async {
    String jsonContent =
        await rootBundle.loadString('assets/offered_shifts.json');

    return ShiftResponse.fromJson(json.decode(jsonContent));
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        _loadShiftAsset().then((value) {
          acceptedShifts = value.data!
              .where((element) => element.status == "accepted")
              .toList();
          incomingShifts = value.data!
              .where((element) => element.status == "waiting")
              .toList();
        });
      });
    });
//load json resposne
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          margin: EdgeInsets.all(16),
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              // color: Colors.white,
            ),
            child: Row(children: [
              SizedBox(
                width: 2,
              ),
              //search button
              Expanded(
                child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        shape: StadiumBorder(),
                        backgroundColor: Color(0xff53c5cd)),
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Shift Offerts",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                width: 2,
              ),
              //invoice button
              Material(
                color: AppColors().mainBackground,
                shape: CircleBorder(),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.file_copy_rounded,
                  ),
                  iconSize: 24,
                ),
              ),
              //profile button
              SizedBox(
                width: 2,
              ),
              Material(
                color: AppColors().mainBackground,
                shape: CircleBorder(),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_outline,
                  ),
                  iconSize: 24,
                ),
              ),
              SizedBox(
                width: 2,
              ),
            ]),
          ),
        ),
        backgroundColor: AppColors().mainBackground,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shift offerts",
                  style: AppStyle().mainHeader,
                ),
                ShiftSection(
                  title: "Dernière MINUTE",
                  shifts: acceptedShifts,
                ),
                ShiftSection(
                  title: "shifts à venir",
                  shifts: incomingShifts,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShiftSection extends StatelessWidget {
  final String? title;
  final List<Shift>? shifts;
  const ShiftSection({
    Key? key,
    this.title,
    this.shifts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, bottom: 8),
          child: Text(
            this.title!.toUpperCase(),
            style: AppStyle().shiftSection,
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: shifts!.length,
            itemBuilder: ((context, index) => ShiftCard(
                  shift: shifts![index],
                ))),
      ],
    );
  }
}

class ShiftCard extends StatelessWidget {
  const ShiftCard({Key? key, this.shift}) : super(key: key);
  final Shift? shift;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      elevation: 3.0,
      margin: EdgeInsets.only(bottom: 12),
      color: AppColors().shiftCardColor,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ShiftDetailsPage()));
        },
        contentPadding: EdgeInsets.all(18),
        title: Text(shift!.company!, style: AppStyle().tileHeader),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Aujourd'hui".toUpperCase(),
                style: AppStyle().subtitleHeader,
              ),
            ),

            //créneaux
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Chip(
                      label: Wrap(
                        children: [
                          Text(
                            "${shift!.postName}",
                            overflow: TextOverflow.fade,
                            style:
                                TextStyle(color: AppColors().chipsetTextColor),
                          ),
                        ],
                      ),
                      visualDensity: VisualDensity.comfortable),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            text:
                                "${double.parse(shift!.buyPrice!.toString()).round()}\$ / H ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              if (shift!.bonus! != 0)
                                TextSpan(
                                    text: "+ ${shift!.bonus!}\$ / H ",
                                    style: TextStyle(color: Colors.green))
                            ]),
                      ),
                      Spacer(),
                      Text(
                        "${shift!.formatDate(shift!.startAt!)} - ${shift!.formatDate(shift!.endAt!)}",
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
