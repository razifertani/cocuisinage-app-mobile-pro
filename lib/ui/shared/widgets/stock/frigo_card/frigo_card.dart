import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../../utils/utils.dart';

import '../../common_product_card.dart';

class FrigoCard extends StatelessWidget {
  final String imgPath;
  final String title;
  const FrigoCard({Key? key, required this.imgPath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommunProductCard(
      topRightWidget: Container(
        height: 30,
        width: 30,
        child: PopupMenuButton(
          padding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          icon: Icon(
            Icons.more_vert,
            color: MyColors.red,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: "ajoutez à ma liste de courses",
              child: Text(
                "ajoutez à ma liste de courses",
                style: MyTextStyles.body,
              ),
            ),
            PopupMenuItem(
              value: "En rupture",
              child: Text(
                "En rupture",
                style: MyTextStyles.body,
              ),
            ),
            PopupMenuItem(
              value: "Promotion",
              child: Text(
                "Promotion",
                style: MyTextStyles.body,
              ),
            ),
            PopupMenuItem(
              value: "Modifier",
              child: Text(
                "Modifier",
                style: MyTextStyles.body,
              ),
            ),
            PopupMenuItem(
              value: "Télécharger le code QR",
              child: Text(
                "Télécharger le code QR",
                style: MyTextStyles.body,
              ),
            ),
            PopupMenuItem(
              value: "Paramétres",
              child: Text(
                "Paramétres",
                style: MyTextStyles.body,
              ),
            ),
          ],
          // onSelected: (item) {
          //   switch (item) {
          //     case "ajoutez à ma liste de courses":
          //       showDialog(
          //           context: context,
          //           builder: (_) => AjouterQuantitePopUp(
          //                 function: () {
          //                   Navigator.pop(_);
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => ListeDeCourseScreen()),
          //                   );
          //                 },
          //               ));
          //       break;

          //     case "En rupture":
          //       Utils.pushScreen(context, const RuptureDeStock(), 0.4);
          //       break;
          //     case "Promotion":
          //       Utils.pushScreen(context, const Promotion(), 0.7);
          //       break;
          //     case "Modifier":
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => ScannerProduitStock()),
          //       );
          //       break;
          //     case "Télécharger le code QR":
          //       Utils.pushScreen(context, PopUpQrCode(), 0.6);
          //       break;
          //     case "Paramétres":
          //       break;
          //     default:
          //   }
          // },
        ),
      ),
      // imgPath: imgPath,
      topLeftWidget: const SizedBox(width: 20),
      bottomLeftWidget: Text(
        "15 L",
        style: MyTextStyles.headline,
      ),
      title: title,
      bottomRightWidget: Container(
        width: 16.w,
        decoration: BoxDecoration(
          color: MyColors.red,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Center(
            child: AutoSizeText(
              "15/03",
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
