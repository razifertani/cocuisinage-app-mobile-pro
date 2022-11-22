import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Theme/my_text_styles.dart';

class PickTime extends StatefulWidget {
  const PickTime({Key? key}) : super(key: key);

  @override
  State<PickTime> createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 15);

  final now = new DateTime.now();

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: GestureDetector(
        onTap: _selectTime,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            DateFormat.Hm().format(DateTime(now.year, now.month, now.day, _time.hour, _time.minute)),
            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
