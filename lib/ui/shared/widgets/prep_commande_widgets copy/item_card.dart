import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../../controllers/theme_controller.dart';

class ItemCard extends StatefulWidget {
  int quantite;
  String name;
  ItemCard({Key? key, required this.name, required this.quantite})
      : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  Color? itemColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: itemColor ??
          (Theme.of(context).scaffoldBackgroundColor == Colors.black
              ? Color(0xFF202020)
              : Colors.white),
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
            itemColor == null ||
                    itemColor == Color(0xFF202020) ||
                    itemColor == Colors.white
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            print("aa");
                            print(itemColor);
                            itemColor = Color(0xFF52C781);
                            print(itemColor);
                            setState(() {});
                          },
                          child: Image.asset(
                              "assets/prep_commande_icons/termine.png")),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            itemColor = Color(0xFFFEBE74);
                            setState(() {});
                          },
                          child: Image.asset(
                              "assets/prep_commande_icons/en_attente.png")),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            itemColor = Colors.red;
                            setState(() {});
                          },
                          child: Image.asset(
                              "assets/prep_commande_icons/sortie_de_stock.png")),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
