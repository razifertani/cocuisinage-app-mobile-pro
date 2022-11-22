import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';

class HaccpProductCard extends StatefulWidget {
  bool isSwitched;
  HaccpProductCard({Key? key, required this.isSwitched}) : super(key: key);

  @override
  State<HaccpProductCard> createState() => _HaccpProductCardState();
}

class _HaccpProductCardState extends State<HaccpProductCard> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: MyColors.red,
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  checkedValue = newValue!;
                });
              },
            ),
            Image.asset(
              "assets/images/app_logo.png",
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Pavés de saumons",
                    style: MyTextStyles.headline,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    "Marque",
                    style: MyTextStyles.body,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            widget.isSwitched
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => AjouterproduitAuTemps()),
                            // );
                          },
                          child: Image.asset("assets/haccp_icons/pencil-cercled.png")),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset("assets/haccp_icons/delete-cercled.png"),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
