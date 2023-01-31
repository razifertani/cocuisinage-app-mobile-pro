import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../utils/globals.dart';

typedef void TimeCallback(String date);

class HeureScreen extends StatefulWidget {
  final TimeCallback ontimeChanged;
  final DateTime currentDate;
  const HeureScreen(
      {Key? key, required this.ontimeChanged, required this.currentDate})
      : super(key: key);

  @override
  State<HeureScreen> createState() => _HeureScreenState();
}

class _HeureScreenState extends State<HeureScreen> {
  late int date;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    date = widget.currentDate.weekday - 1;
  }

  int currentVIndex = 0;
  int currentHIndex = 0;
  void switchIndex(verIndex, horIndex) {
    currentHIndex = horIndex;
    currentVIndex = verIndex;
    print(date);
    widget.ontimeChanged(verIndex == 0
        ? DateFormat.Hm().format(Globals.profile
                .getEstablishment()
                .schedules[1]
                .begin ??
            DateTime(2022, 1, 1, 8, 0).add(Duration(
                minutes: Globals.profile.getEstablishment().bookingDuration *
                    (currentHIndex))))
        : DateFormat.Hm().format(Globals.profile
                .getEstablishment()
                .schedules[1]
                .secondBegin ??
            DateTime(2022, 1, 1, 12, 0).add(Duration(
                minutes: Globals.profile.getEstablishment().bookingDuration *
                    (currentHIndex)))));
    setState(() {});
  }

  List<String> labels = ["Petit Déjeuner", "Déjeuner"];

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
                  2,
                  (verIndex) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            labels[verIndex],
                            style: MyTextStyles.subhead,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(
                                  verIndex == 0
                                      ? (((Globals.profile
                                                              .getEstablishment()
                                                              .schedules[date]
                                                              .ending ??
                                                          DateTime(
                                                              2022, 1, 1, 12, 0))
                                                      .difference(Globals
                                                              .profile
                                                              .getEstablishment()
                                                              .schedules[date]
                                                              .begin ??
                                                          DateTime(
                                                              2022, 1, 1, 8, 0)))
                                                  .inMinutes)
                                              .toInt() ~/
                                          Globals.profile
                                              .getEstablishment()
                                              .bookingDuration
                                      : (((Globals.profile
                                                              .getEstablishment()
                                                              .schedules[date]
                                                              .secondEnd ??
                                                          DateTime(2022, 1, 1, 12, 0))
                                                      .difference(Globals.profile.getEstablishment().schedules[date].secondBegin ?? DateTime(2022, 1, 1, 8, 0)))
                                                  .inMinutes)
                                              .toInt() ~/
                                          Globals.profile.getEstablishment().bookingDuration,
                                  (horIndex) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: GestureDetector(
                                          onTap: () {
                                            switchIndex(verIndex, horIndex);
                                          },
                                          child: Container(
                                            height: 45,
                                            width: 60,
                                            child: Center(
                                                child: verIndex == 0
                                                    ? Text(DateFormat.Hm().format(Globals
                                                            .profile
                                                            .getEstablishment()
                                                            .schedules[1]
                                                            .begin ??
                                                        DateTime(2022, 1, 1, 8, 0)
                                                            .add(Duration(
                                                                minutes: Globals
                                                                        .profile
                                                                        .getEstablishment()
                                                                        .bookingDuration *
                                                                    (horIndex)))))
                                                    : Text(
                                                        DateFormat.Hm().format(Globals.profile.getEstablishment().schedules[1].secondBegin ?? DateTime(2022, 1, 1, 12, 0).add(Duration(minutes: Globals.profile.getEstablishment().bookingDuration * (horIndex)))))),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: (currentHIndex ==
                                                            horIndex &&
                                                        currentVIndex ==
                                                            verIndex)
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
