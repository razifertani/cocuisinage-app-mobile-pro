import 'package:flutter/material.dart';

import '../../../../Theme/my_text_styles.dart';

class ExpansionTileDrawer extends StatelessWidget {
  String title;
  String iconPath;
  List<Widget> widgets;
  ExpansionTileDrawer(
      {Key? key,
      required this.title,
      required this.iconPath,
      required this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        iconColor: Colors.black,
        textColor: Colors.black,
        expandedAlignment: Alignment.bottomLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.only(left: 50),
        title: Row(
          children: [
            Image.asset(iconPath),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style:
                    MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        children: widgets,
      ),
    );
  }
}
