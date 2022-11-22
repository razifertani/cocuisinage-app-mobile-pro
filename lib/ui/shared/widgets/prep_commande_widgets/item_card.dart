import 'package:flutter/material.dart';

import '../../../../Theme/my_text_styles.dart';

class ItemCard extends StatefulWidget {
  int quantite;
  String name;
  ItemCard({Key? key, required this.name, required this.quantite})
      : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  Color itemColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: itemColor,
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
            itemColor == Colors.white
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            itemColor = Color(0xFF52C781);
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
