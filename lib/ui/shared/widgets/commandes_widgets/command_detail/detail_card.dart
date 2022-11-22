import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/commandes_widgets/command_detail/settings_pop_up.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailCard extends StatelessWidget {
  int quantite;
  String nom;
  String? remarque;
  String prix;
  bool? isLivraison;
  DetailCard(
      {Key? key,
      required this.quantite,
      required this.nom,
      required this.prix,
      this.isLivraison,
      this.remarque})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // isLivraison ?? false
        //     ? Utils.pushScreen(context, LivrasionCommandSettingsPopUp(), 0.6)
        //     :
        Utils.pushScreen(context, const SettingsPopUP(), 0.5);
      },
      child: SizedBox(
        height: 13.h,
        width: 90.w,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(children: [
              Container(
                height: 6.h,
                width: 10.w,
                child: Center(
                    child: AutoSizeText(
                  "$quantite",
                  style: MyTextStyles.headline.copyWith(color: Colors.black),
                )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF3F3F3)),
              ),
              const SizedBox(
                width: 15,
              ),
              remarque == null
                  ? Expanded(
                      child: AutoSizeText(
                        nom,
                        style: MyTextStyles.headline,
                        maxLines: 2,
                      ),
                    )
                  : Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              nom,
                              style: MyTextStyles.headline,
                              maxLines: 2,
                            ),
                          ),
                          Expanded(
                            child: AutoSizeText(remarque ?? "",
                                style: MyTextStyles.subhead
                                    .copyWith(color: Colors.grey)),
                          )
                        ],
                      ),
                    ),
              AutoSizeText(
                prix,
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
