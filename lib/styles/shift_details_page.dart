import 'package:flutter/material.dart';

import '../widgets/shift_custom_icon.dart';
import 'font.dart';

class ShiftDetailsPage extends StatefulWidget {
  const ShiftDetailsPage({Key? key}) : super(key: key);

  @override
  State<ShiftDetailsPage> createState() => _ShiftDetailsPageState();
}

class _ShiftDetailsPageState extends State<ShiftDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //shift details header

              CircleAvatar(
                radius: 42,
              ),
              SizedBox(
                height: 8,
              ),
              Text("Bistro Sous le Fort",
                  style: TextStyle(
                    fontSize: 22,
                  )),

              Text("AUJOURD'HUI"),
              Row(
                children: [],
              ),
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
    );
  }
}
