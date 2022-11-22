import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleMessageCard extends StatelessWidget {
  bool isMe;
  String msgText;
  SingleMessageCard({Key? key, required this.isMe, required this.msgText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Align(
        alignment: isMe ? Alignment.topRight : Alignment.topLeft,
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            SizedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                color: isMe ? Color(0xFFE3818D) : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    msgText,
                    style: MyTextStyles.body,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                DateFormat.jm().format(DateTime.now()),
                style: MyTextStyles.body,
              ),
            )
          ],
        ),
      ),
    );
  }
}
