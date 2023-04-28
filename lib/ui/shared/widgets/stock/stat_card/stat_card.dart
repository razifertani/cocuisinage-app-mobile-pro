import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_text_styles.dart';

class StatCard extends StatelessWidget {
  String cardTilte;
  int totaleQte;
  Widget bottomWidget;

  StatCard(
      {Key? key,
      required this.cardTilte,
      required this.totaleQte,
      required this.bottomWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: 50.w,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
                child: AutoSizeText(
                  cardTilte,
                  style: MyTextStyles.cardTextStyle,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(totaleQte.toString(),
                  style: MyTextStyles.headline.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
              const Spacer(),
              bottomWidget
            ],
          ),
        ),
      ),
    );
  }
}
