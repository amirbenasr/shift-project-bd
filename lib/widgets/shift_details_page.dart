import 'package:flutter/material.dart';

import 'shift_custom_icon.dart';
import '../styles/colors.dart';
import '../styles/font.dart';

class ShiftDetailsPage extends StatefulWidget {
  const ShiftDetailsPage({Key? key}) : super(key: key);

  @override
  State<ShiftDetailsPage> createState() => _ShiftDetailsPageState();
}

class _ShiftDetailsPageState extends State<ShiftDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(16),
        child: OutlinedButton(
          child: Text("Postuler", style: TextStyle(color: Colors.white)),
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(12),
              shape: StadiumBorder(),
              backgroundColor: Color(0xff53c5cd)),
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.black,
              shape: CircleBorder(),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //shift details header

                Center(
                  child: CircleAvatar(
                    radius: 42,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text("Bistro Sous le Fort",
                      style: TextStyle(
                        fontSize: 22,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "AUJOURD'HUI",
                ),
                SizedBox(
                  height: 8,
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
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [],
                ),

                //shift details section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShiftCustomIcon(
                      icon: Icon(Icons.location_on_outlined),
                      text: "48 Rue blablabla",
                    ),
                    ShiftCustomIcon(
                      icon: Icon(Icons.attach_money),
                      text: "48 Rue blablabla",
                    ),
                    ShiftCustomIcon(
                      icon: Icon(Icons.pause_outlined),
                      text: "48 Rue blablabla",
                    ),
                    ShiftCustomIcon(
                      icon: Icon(Icons.local_parking_outlined),
                      text: "48 Rue blablabla",
                    ),
                    ShiftCustomIcon(
                      icon: Icon(Icons.emoji_people),
                      text: "48 Rue blablabla",
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Responsable".toUpperCase(),
                      style: AppStyle().shiftSection,
                    ),
                    Text(
                      "Gregorie Kovalaks",
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
