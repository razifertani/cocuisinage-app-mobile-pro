import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class FournisseurReseauCard extends StatelessWidget {
  String nom;
  String type;
  String imgPath;
  FournisseurReseauCard(
      {Key? key, required this.imgPath, required this.nom, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 60.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 24,
                  backgroundColor: MyColors.red,
                  child: CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(imgPath),
                      child: Material(
                          shape: const CircleBorder(),
                          clipBehavior: Clip.hardEdge,
                          color: Colors.transparent,
                          child: InkWell(onTap: () {})))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AutoSizeText(
                nom,
                style: MyTextStyles.headline,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              child: AutoSizeText(
                type,
                style: MyTextStyles.subhead,
                maxLines: 1,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  // color: Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0)),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: Icon(Icons.phone_outlined),
                    ),
                    VerticalDivider(
                      thickness: 2,
                    ),
                    Expanded(
                      child: Icon(Icons.mail_outlined),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
