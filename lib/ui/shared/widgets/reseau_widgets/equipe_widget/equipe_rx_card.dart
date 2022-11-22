import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';

class EquipeRxCard extends StatelessWidget {
  EquipeRxCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
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
          const SizedBox(
            width: 15,
          ),
          Text(
            "Alice patelchi",
            style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          InkWell(
              onTap: () {},
              child: Image.asset("assets/reseau_icons/send_msg.png"))
        ],
      ),
    );
  }
}
