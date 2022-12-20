import 'package:flutter/material.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class DureeDeServiceScreen extends StatefulWidget {
  DureeDeServiceScreen({Key? key}) : super(key: key);

  @override
  State<DureeDeServiceScreen> createState() => _DureeDeServiceScreenState();
}

class _DureeDeServiceScreenState extends State<DureeDeServiceScreen> {
  final List<String> times = ["30 min", "45 min", "60 min", "75 min"];
  int currentIndex = 0;
  void switchIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Durée de réservation",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Tranche horraire",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                ...List.generate(
                    4,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          child: InkWell(
                            onTap: () {
                              switchIndex(index);
                            },
                            child: Card(
                              elevation: 3,
                              color:
                                  currentIndex == index ? MyColors.red : null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                child: Text(times[index],
                                    style: MyTextStyles.subhead.copyWith(
                                        color: currentIndex == index
                                            ? Colors.white
                                            : Colors.grey)),
                              ),
                            ),
                          ),
                        ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
