import 'package:flutter/material.dart';

import '../models/shift_response_model.dart';
import '../widgets/shift_custom_icon.dart';
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
                    backgroundImage: NetworkImage(
                        "https://res.cloudinary.com/tf-lab/image/upload/w_600,h_337,c_fill,g_auto:subject,q_auto,f_auto/restaurant/dfdd0f5e-7ea7-4e99-9ae3-05b5a2f77f51/091d22d1-028e-435c-9007-a25c5366144b.png"),
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
                  style: (widget.shift!.status == "waiting")
                      ? null
                      : AppStyle().subtitleHeader,
                ),
                SizedBox(
                  height: 8,
                ),
                //créneaux
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Chip(
                        label: Wrap(
                          children: [
                            Text(
                              "${widget.shift!.postName}",
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  color: AppColors().chipsetTextColor),
                            ),
                          ],
                        ),
                        visualDensity: VisualDensity.comfortable),
                    SizedBox(
                      width: 5,
                    ),
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
                      style: (widget.shift!.status == "waiting")
                          ? null
                          : TextStyle(color: Colors.red),
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
                      text: "Bonus au travailleur: +${widget.shift!.bonus}\$/H",
                    ),
                    ShiftCustomIcon(
                      icon: Icon(Icons.pause_outlined),
                      text: "Pause de 30 minutes",
                    ),
                    ShiftCustomIcon(
                      icon: Icon(Icons.local_parking_outlined),
                      text: "Stationnement gratuit ",
                    ),
                    ShiftCustomIcon(
                      icon: Icon(Icons.emoji_people),
                      text: "Pantalon noir, chemise noir",
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
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Gregorie Kovalaks\t",
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
