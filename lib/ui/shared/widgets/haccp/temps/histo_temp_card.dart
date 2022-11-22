import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HistoriqueTempCard extends StatelessWidget {
  String title;
  String info;
  String produits;
  HistoriqueTempCard(
      {Key? key,
      required this.title,
      required this.produits,
      required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      width: 95.w,
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: MyTextStyles.subhead,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: AutoSizeText(
                        produits,
                        style: MyTextStyles.cardTextStyle,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: AutoSizeText(
                        info,
                        style: MyTextStyles.subhead,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset("assets/haccp_icons/pencil-cercled.png"),
              const SizedBox(
                width: 5,
              ),
              Image.asset("assets/haccp_icons/delete-cercled.png")
            ],
          ),
        ),
      ),
    );
  }
}
