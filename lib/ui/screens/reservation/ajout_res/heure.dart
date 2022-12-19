import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../Theme/my_colors.dart';

typedef void TimeCallback(String date);

class HeureScreen extends StatefulWidget {
  final TimeCallback ontimeChanged;
  const HeureScreen({Key? key, required this.ontimeChanged}) : super(key: key);

  @override
  State<HeureScreen> createState() => _HeureScreenState();
}

class _HeureScreenState extends State<HeureScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  var date = DateTime.now();
  int currentVIndex = 0;
  int currentHIndex = 0;
  void switchIndex(hIndex, vIndex) {
    currentHIndex = hIndex;
    currentVIndex = vIndex;
    widget.ontimeChanged.call(hIndex == 0
        ? ptDejTemp[vIndex]
        : hIndex == 1
            ? dejTemp[vIndex]
            : dinerTemp[vIndex]);
    setState(() {});
  }

  List<String> labels = ["Petit Déjeuner", "Déjeuner", "Dinner"];

  List<String> ptDejTemp = ["8:00", "8:15", "8:30", "8:45", "9:00"];
  List<String> dejTemp = ["12:00", "12:15", "12:30", "12:45", "13:00"];
  List<String> dinerTemp = ["18:00", "18:15", "18:30", "18:45", "19:00"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  3,
                  (hIndex) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            labels[hIndex],
                            style: MyTextStyles.subhead,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(
                                  5,
                                  (vIndex) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: GestureDetector(
                                          onTap: () {
                                            switchIndex(hIndex, vIndex);
                                          },
                                          child: Container(
                                            height: 45,
                                            width: 60,
                                            child: Center(
                                                child: hIndex == 0
                                                    ? Text(ptDejTemp[vIndex])
                                                    : hIndex == 1
                                                        ? Text(dejTemp[vIndex])
                                                        : Text(
                                                            dinerTemp[vIndex])),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: (currentHIndex ==
                                                            hIndex &&
                                                        currentVIndex == vIndex)
                                                    ? MyColors.red
                                                    : null,
                                                border: Border.all(
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                          ),
                                        ),
                                      )),
                            ],
                          )
                        ],
                      ))
            ],
          ),
        ],
      ),
    );
  }
}
