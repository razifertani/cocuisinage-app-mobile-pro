import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../shared/pop_up_card.dart';

class LivraisonCommandeInfoAction extends StatelessWidget {
  const LivraisonCommandeInfoAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 55.h,
            width: 85.w,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  PopUpCard(title: "Réfuser le produit", fun: (a, b, c) {}),
                  PopUpCard(title: "Ajouter au stock", fun: (a, b, c) {}),
                  PopUpCard(title: "Ajouter la température", fun: (a, b, c) {}),
                  PopUpCard(title: "Modifier prix", fun: (a, b, c) {}),
                  PopUpCard(title: "Modifier la quantité", fun: (a, b, c) {}),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
