import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Theme/my_text_styles.dart';

typedef void TimeCallback(TimeOfDay time);

class PickTime extends StatefulWidget {
  final TimeCallback onTimeChanged;
  TimeOfDay time;
  PickTime({Key? key, required this.onTimeChanged, required this.time}) : super(key: key);

  @override
  State<PickTime> createState() => _PickTimeState();
}

class _PickTimeState extends State<PickTime> {
  final now = new DateTime.now();

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: widget.time,
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
        widget.time = newTime;
        widget.onTimeChanged(widget.time);
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
            DateFormat.Hm().format(DateTime(now.year, now.month, now.day, widget.time.hour, widget.time.minute)),
            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
