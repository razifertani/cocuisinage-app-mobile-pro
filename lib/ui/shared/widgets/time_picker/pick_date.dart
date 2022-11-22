import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../Theme/my_text_styles.dart';

class PickDate extends StatefulWidget {
  const PickDate({Key? key}) : super(key: key);

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  @override
  DateTime _date = DateTime(2021, 11, 17);

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020, 12),
      lastDate: DateTime(2025, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          onSurface: Colors.green,
        )),
        child: GestureDetector(
          onTap: _selectDate,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              DateFormat.yMd('fr').format(_date),
              style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
