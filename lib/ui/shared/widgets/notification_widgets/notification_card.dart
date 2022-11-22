import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class NotificationCard extends StatelessWidget {
  String title;
  String date;
  String imagePath;

  NotificationCard({
    Key? key,
    required this.title,
    required this.date,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: CircleAvatar(
                radius: 33,
                backgroundImage: NetworkImage(imagePath),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MyTextStyles.subhead,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    date,
                    style: MyTextStyles.body,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
