import 'package:flutter/material.dart';
import 'package:shift_project/styles/colors.dart';
import 'package:shift_project/styles/font.dart';

import 'styles/shift_details_page.dart';

class ShiftPage extends StatefulWidget {
  const ShiftPage({Key? key}) : super(key: key);

  @override
  State<ShiftPage> createState() => _ShiftPageState();
}

class _ShiftPageState extends State<ShiftPage> {
  @override
  void initState() {
    // TODO: implement initState
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
                ),
                ShiftSection(
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

class ShiftSection extends StatelessWidget {
  final String? title;
  const ShiftSection({
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
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ShiftDetailsPage()));
        },
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
