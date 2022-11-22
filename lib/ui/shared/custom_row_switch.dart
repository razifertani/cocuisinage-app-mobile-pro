import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Theme/my_colors.dart';
import '../../Theme/my_text_styles.dart';

class CustomRowSwitch extends StatefulWidget {
  String text;
  bool value;
  Function(bool)? onChanged;
  CustomRowSwitch(
      {Key? key,
      required this.text,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomRowSwitch> createState() => _CustomRowSwitchState();
}

class _CustomRowSwitchState extends State<CustomRowSwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AutoSizeText(
              widget.text,
              style: MyTextStyles.subhead,
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 12.w,
            child: FittedBox(
              child: Switch(
                activeColor: MyColors.red,
                value: widget.value,
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
