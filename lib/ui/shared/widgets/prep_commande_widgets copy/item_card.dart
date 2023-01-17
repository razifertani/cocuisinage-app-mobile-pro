import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/commandes_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../../Theme/my_text_styles.dart';

class ItemCard extends StatefulWidget {
  int commandeProductID;
  int quantite;
  String name;
  ItemCard({Key? key, required this.commandeProductID, required this.name, required this.quantite}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  Color? itemColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: itemColor ?? (Theme.of(context).scaffoldBackgroundColor == Colors.black ? Color(0xFF202020) : Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              widget.quantite.toString(),
              style: MyTextStyles.headline,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.name,
              style: MyTextStyles.headline,
            ),
            const Spacer(),
            itemColor == null || itemColor == Color(0xFF202020) || itemColor == Colors.white
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            itemColor = Color(0xFF52C781);
                            setState(() {});
                            updateCommandeProductStatusWS(
                              id: widget.commandeProductID,
                              status: '1',
                            ).then(
                              (exceptionOrMessage) {
                                exceptionOrMessage.fold(
                                  (exception) {
                                    Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                  },
                                  (message) {
                                    setState(() {});
                                    Utils.showCustomTopSnackBar(context, success: true, message: message);
                                  },
                                );
                              },
                            );
                          },
                          child: Image.asset("assets/prep_commande_icons/termine.png")),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            itemColor = Color(0xFFFEBE74);
                            setState(() {});
                            updateCommandeProductStatusWS(
                              id: widget.commandeProductID,
                              status: '2',
                            ).then(
                              (exceptionOrMessage) {
                                exceptionOrMessage.fold(
                                  (exception) {
                                    Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                  },
                                  (message) {
                                    setState(() {});
                                    Utils.showCustomTopSnackBar(context, success: true, message: message);
                                  },
                                );
                              },
                            );
                          },
                          child: Image.asset("assets/prep_commande_icons/en_attente.png")),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            itemColor = Colors.red;
                            setState(() {});
                            updateCommandeProductStatusWS(
                              id: widget.commandeProductID,
                              status: '3',
                            ).then(
                              (exceptionOrMessage) {
                                exceptionOrMessage.fold(
                                  (exception) {
                                    Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                  },
                                  (message) {
                                    setState(() {});
                                    Utils.showCustomTopSnackBar(context, success: true, message: message);
                                  },
                                );
                              },
                            );
                          },
                          child: Image.asset("assets/prep_commande_icons/sortie_de_stock.png")),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
