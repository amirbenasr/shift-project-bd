import 'package:flutter/material.dart';

import '../models/shift_response_model.dart';
import 'shift_custom_icon.dart';
import '../styles/colors.dart';
import '../styles/font.dart';

class ShiftDetailsPage extends StatefulWidget {
  const ShiftDetailsPage({Key? key, this.shift}) : super(key: key);
  final Shift? shift;

  @override
  State<ShiftDetailsPage> createState() => _ShiftDetailsPageState();
}

class _ShiftDetailsPageState extends State<ShiftDetailsPage> {
  String? _address;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        widget.shift!.getLocation().then((value) => _address = value);
      });
    });
    // TODO: implement initState
    super.initState();
  }

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
                  child: Text(widget.shift!.company!,
                      style: TextStyle(
                        fontSize: 22,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.shift!.formatTofrench(widget.shift!.startAt!),
                ),
                SizedBox(
                  height: 8,
                ),
                //créneaux
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text:
                              "${double.parse(widget.shift!.buyPrice!.toString()).round()}\$ / H ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            if (widget.shift!.bonus! != 0)
                              TextSpan(
                                  text: "+ ${widget.shift!.bonus!}\$ / H ",
                                  style: TextStyle(color: Colors.green))
                          ]),
                    ),
                    Spacer(),
                    Text(
                      "${widget.shift!.formatDate(widget.shift!.startAt!)} - ${widget.shift!.formatDate(widget.shift!.endAt!)}",
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
                      text: "${_address}",
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
