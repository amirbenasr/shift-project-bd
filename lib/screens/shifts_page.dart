import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shift_project/styles/colors.dart';
import 'package:shift_project/styles/font.dart';

import '../models/shift_response_model.dart';
import '../widgets/shift_section.dart';

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
          margin: const EdgeInsets.all(16),
          child: Container(
            height: 58,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              // color: Colors.white,
            ),
            child: Row(children: [
              const SizedBox(
                width: 2,
              ),
              //search button
              Expanded(
                child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        shape: const StadiumBorder(),
                        backgroundColor: const Color(0xff53c5cd)),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Shifts Offerts",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                width: 2,
              ),
              //invoice button
              Material(
                color: AppColors().mainBackground,
                shape: const CircleBorder(),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.file_copy_rounded,
                  ),
                  iconSize: 24,
                ),
              ),
              //profile button
              const SizedBox(
                width: 2,
              ),
              Material(
                color: AppColors().mainBackground,
                shape: const CircleBorder(),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_outline,
                  ),
                  iconSize: 24,
                ),
              ),
              const SizedBox(
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
                  "Shifts offerts",
                  style: AppStyle().mainHeader,
                ),
                ShiftSection(
                  title: "Dernière MINUTE",
                  shifts: acceptedShifts,
                  formatDate: false,
                ),
                ShiftSection(
                  title: "shifts à venir",
                  shifts: incomingShifts,
                  formatDate: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
