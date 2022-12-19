import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/time_picker/pick_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';

typedef void DateCallback(DateTime date);

class DateScreen extends StatefulWidget {
  final DateCallback ondateChanged;
  final DateTime? initialDateTime;
  DateScreen({
    Key? key,
    required this.ondateChanged,
    this.initialDateTime,
  }) : super(key: key);

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  @override
  late DateTime currentDate;
  void initState() {
    super.initState();
    initializeDateFormatting();
    currentDate = widget.initialDateTime ?? DateTime.now();
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
            setState(() {
              currentDate = date;
              widget.ondateChanged(date);
            });
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
