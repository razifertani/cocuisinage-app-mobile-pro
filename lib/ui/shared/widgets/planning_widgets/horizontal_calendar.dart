import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import '../../../../Theme/my_colors.dart';

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({Key? key, this.ondateChanged, this.initialDateTime})
      : super(key: key);
  final Function(DateTime date)? ondateChanged;
  final DateTime? initialDateTime;

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: initialDateTime ?? DateTime.now(),
      firstDate: DateTime(2022, 1, 15),
      lastDate: DateTime(2025, 12, 31),
      onDateSelected: ondateChanged ?? (date) {},

      leftMargin: 20,
      monthColor: MyColors.red,
      dayColor: Colors.grey,
      activeDayColor: Colors.white,
      activeBackgroundDayColor: MyColors.red,
      dotsColor: Colors.transparent,
      // selectableDayPredicate: (date) => date.day != 23,
      locale: 'fr',
    );
  }
}
