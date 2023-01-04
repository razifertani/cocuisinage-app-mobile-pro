import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/commande.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/commandes_widgets/command_detail/settings_pop_up.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailCard extends StatefulWidget {
  CommandeProduct commandeProduct;

  DetailCard({
    Key? key,
    required this.commandeProduct,
  }) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
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
            child: Row(
              children: [
                Container(
                  height: 6.h,
                  width: 10.w,
                  child: Center(
                    child: AutoSizeText(
                      "${widget.commandeProduct.qte}",
                      style: MyTextStyles.headline.copyWith(color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFF3F3F3)),
                ),
                const SizedBox(
                  width: 15,
                ),
                widget.commandeProduct.message == null
                    ? Expanded(
                        child: AutoSizeText(
                          '${widget.commandeProduct.establishmentProduct?.product.name}',
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
                                '${widget.commandeProduct.establishmentProduct?.product.name}',
                                style: MyTextStyles.headline,
                                maxLines: 2,
                              ),
                            ),
                            Expanded(
                              child: AutoSizeText('${widget.commandeProduct.message}', style: MyTextStyles.subhead.copyWith(color: Colors.grey)),
                            )
                          ],
                        ),
                      ),
                AutoSizeText(
                  '${widget.commandeProduct.prix}',
                  style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
