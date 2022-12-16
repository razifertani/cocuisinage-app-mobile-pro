import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../Theme/my_colors.dart';

class HeureScreen extends StatefulWidget {
  const HeureScreen({Key? key}) : super(key: key);

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
    setState(() {});
  }

  int textIndex = 0;
  void switchText(index) {
    textIndex = index;
    setState(() {});
  }

  List<String> labels = ["Petit Déjeuner", "Déjeuner", "Dinner"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    if (textIndex > 0) textIndex -= 1;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                  )),
              Text(
                labels[textIndex],
              ),
              GestureDetector(
                  onTap: () {
                    if (textIndex < 2) textIndex += 1;

                    setState(() {});
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  5,
                  (hIndex) => Column(
                        children: [
                          ...List.generate(
                              3,
                              (vIndex) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: GestureDetector(
                                      onTap: () {
                                        switchIndex(hIndex, vIndex);
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 60,
                                        child: Center(child: Text("8:00")),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: (currentHIndex == hIndex &&
                                                    currentVIndex == vIndex)
                                                ? MyColors.red
                                                : null,
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      ),
                                    ),
                                  ))
                        ],
                      ))
            ],
          ),
        ],
      ),
    );
  }
}
