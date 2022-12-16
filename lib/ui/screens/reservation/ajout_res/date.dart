import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({Key? key}) : super(key: key);

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  var currentDate = DateTime.now();
  int currentVIndex = 0;
  int currentHIndex = 0;
  void switchIndex(hIndex, vIndex) {
    currentHIndex = hIndex;
    currentVIndex = vIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: CalendarCarousel<Event>(
          onDayPressed: (DateTime date, List<Event> events) {
            setState(() => currentDate = date);
          },
          weekendTextStyle: TextStyle(color: Theme.of(context).primaryColor),
          thisMonthDayBorderColor: Colors.grey,
          weekdayTextStyle: TextStyle(color: Theme.of(context).primaryColor),
          selectedDayButtonColor: MyColors.red,
          selectedDayBorderColor: Theme.of(context).primaryColor,
          weekFormat: false,
          headerTextStyle:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
          iconColor: Theme.of(context).primaryColor,
          locale: 'fr',
          customGridViewPhysics: NeverScrollableScrollPhysics(),
          pageSnapping: true,
          todayButtonColor: Colors.transparent,
          todayBorderColor: Colors.red,
          todayTextStyle: TextStyle(color: Colors.red),
          selectedDateTime: currentDate,
          daysHaveCircularBorder: false,
          daysTextStyle: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
