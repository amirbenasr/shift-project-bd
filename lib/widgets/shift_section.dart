import 'package:flutter/material.dart';

import '../models/shift_response_model.dart';
import '../styles/font.dart';
import 'shift_card.dart';

class ShiftSection extends StatelessWidget {
  final String? title;
  final List<Shift>? shifts;
  final bool? formatDate;
  const ShiftSection({
    Key? key,
    this.title,
    this.shifts,
    this.formatDate,
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
                  format: this.formatDate,
                  shift: shifts![index],
                ))),
      ],
    );
  }
}
