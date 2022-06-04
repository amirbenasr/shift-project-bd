import 'package:flutter/material.dart';

class ShiftCustomIcon extends StatelessWidget {
  const ShiftCustomIcon({Key? key, this.icon, this.text}) : super(key: key);
  final Widget? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
              height: 30,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(), shape: BoxShape.circle),
              child: IconButton(
                padding: EdgeInsets.zero,
                // iconSize: 24,
                onPressed: () {},
                icon: this.icon!,
              )),
          Text("$text")
        ],
      ),
    );
  }
}
