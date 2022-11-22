import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProduitEnAttenteCard extends StatelessWidget {
  String title;
  String info;
  ProduitEnAttenteCard({Key? key, required this.title, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.h,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: MyTextStyles.headline,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      info,
                      maxLines: 1,
                      style: MyTextStyles.subhead,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/haccp_icons/delete-cercled.png")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
