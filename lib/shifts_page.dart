import 'package:flutter/material.dart';
import 'package:shift_project/styles/colors.dart';
import 'package:shift_project/styles/font.dart';

class ShiftPage extends StatefulWidget {
  const ShiftPage({Key? key}) : super(key: key);

  @override
  State<ShiftPage> createState() => _ShiftPageState();
}

class _ShiftPageState extends State<ShiftPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                LastMinuteSection(
                  title: "Dernière MINUTE",
                ),
                LastMinuteSection(
                  title: "shifts à venir",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LastMinuteSection extends StatelessWidget {
  final String? title;
  const LastMinuteSection({
    Key? key,
    this.title,
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
            itemCount: 2,
            itemBuilder: ((context, index) => ShiftCard())),
      ],
    );
  }
}

class ShiftCard extends StatelessWidget {
  const ShiftCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      elevation: 3.0,
      margin: EdgeInsets.only(bottom: 12),
      color: AppColors().shiftCardColor,
      child: ListTile(
        contentPadding: EdgeInsets.all(18),
        title: Text("Bistro Sous le Fort", style: AppStyle().tileHeader),
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
                Chip(
                    label: Text(
                      "Cuisinier",
                      style: TextStyle(color: AppColors().chipsetTextColor),
                    ),
                    visualDensity: VisualDensity.comfortable),
                SizedBox(
                  width: 5,
                ),
                RichText(
                  text: TextSpan(
                      text: "14\$ / H ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "+ 14\$ / H ",
                            style: TextStyle(color: Colors.green))
                      ]),
                ),
                Spacer(),
                Text(
                  "16:00 - 22:00",
                  style: TextStyle(color: Colors.red),
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
