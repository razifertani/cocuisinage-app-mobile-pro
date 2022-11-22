import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../Theme/my_colors.dart';

class AbonneeCard extends StatefulWidget {
  AbonneeCard({Key? key}) : super(key: key);

  @override
  State<AbonneeCard> createState() => _AbonneeCardState();
}

class _AbonneeCardState extends State<AbonneeCard> {
  bool abonne = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 30,
                  backgroundImage: const NetworkImage(
                      "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
                  child: Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: InkWell(onTap: () {}))),
              SizedBox(
                width: 10,
              ),
              Text(
                "Alice patelchi",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          ElevatedButton(
              child: AutoSizeText(abonne ? "s'abonner" : "Se desabonner"),
              onPressed: () {
                setState(() {
                  abonne = !abonne;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: abonne ? MyColors.red : Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                textStyle: MyTextStyles.buttonTextStyle,
              ))
        ],
      ),
    );
  }
}
