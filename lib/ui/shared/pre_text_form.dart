import 'package:flutter/material.dart';

import '../../Theme/my_text_styles.dart';

class PreTextForm extends StatelessWidget {
  String txt;
  PreTextForm({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          txt,
          style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
