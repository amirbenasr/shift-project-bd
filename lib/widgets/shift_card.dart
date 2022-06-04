import 'package:flutter/material.dart';

import '../models/shift_response_model.dart';
import '../styles/colors.dart';
import '../styles/font.dart';
import 'shift_details_page.dart';

class ShiftCard extends StatelessWidget {
  const ShiftCard({
    Key? key,
    this.shift,
  }) : super(key: key);
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ShiftDetailsPage(
                    shift: shift,
                  )));
        },
        contentPadding: EdgeInsets.all(18),
        title: Text(shift!.company!, style: AppStyle().tileHeader),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    shift!.formatTofrench(shift!.startAt!).toUpperCase(),
                    style: shift!.status == "waiting"
                        ? AppStyle().subtitleHeader.copyWith(
                            color: AppColors().chipsetTextColor, fontSize: 14)
                        : AppStyle().subtitleHeader)),

            //créneaux
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
