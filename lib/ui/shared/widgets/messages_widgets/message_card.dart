import 'package:cocuisinage_app_mobile_pro/Theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_text_styles.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        // color: color,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        child: Row(
          children: [
            const CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
            ),
            SizedBox(
              width: 3.w,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alice patelchi",
                      style: MyTextStyles.subhead,
                    ),
                    Text(
                      "Trés bon accueil ",
                      style: MyTextStyles.body,
                    ),
                    Divider(
                      thickness: 0,
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  DateFormat('dd MMM yyyy').format(DateTime.now()),
                  style: MyTextStyles.body,
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(color: MyColors.red, borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Text(
                    "2",
                    style: MyTextStyles.body.copyWith(color: Colors.white),
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
