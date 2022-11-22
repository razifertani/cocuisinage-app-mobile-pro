import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mes_commandes/commandes_details/commandes_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class CommandCard extends StatelessWidget {
  String montant;
  String date;
  Widget rightWidget;
  bool? confirme;
  String? typeDeLivraison;
  CommandCard(
      {Key? key,
      required this.montant,
      required this.date,
      required this.rightWidget,
      this.confirme = false,
      this.typeDeLivraison})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 3,
            child: Container(
              width: 88.w,
              height: 8.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(date, style: MyTextStyles.body),
                    Text(montant,
                        style: MyTextStyles.body
                            .copyWith(fontWeight: FontWeight.bold)),
                    confirme!
                        ? Text(
                            typeDeLivraison ?? "",
                            style: MyTextStyles.body,
                            maxLines: 2,
                          )
                        : const SizedBox(),
                    rightWidget,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 15,
              right: -10,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.grey.withOpacity(0.5)),
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommandDetailScreen()),
                      );
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
