import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../common_product_card.dart';

class BoutiqueCard extends StatefulWidget {
  const BoutiqueCard({Key? key}) : super(key: key);

  @override
  State<BoutiqueCard> createState() => _BoutiqueCardState();
}

class _BoutiqueCardState extends State<BoutiqueCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.0015)
        ..rotateY(pi * _animation.value),
      child: _animation.value <= 0.5
          ? CommunProductCard(
              title: "Coca_Cola Zero",
              topLeftWidget: GestureDetector(
                  onTap: () {
                    if (_status == AnimationStatus.dismissed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                  },
                  child: Image.asset("assets/stock_icons/info.png")),
              bottomRightWidget: Container(
                width: 15.w,
                decoration: BoxDecoration(
                  color: MyColors.red,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Center(
                    child: Text(
                      "12\$",
                      style: MyTextStyles.subhead.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              topRightWidget: PopupMenuButton(
                padding: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                icon: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.more_vert,
                    size: 20,
                    color: MyColors.red,
                  ),
                ),
                itemBuilder: (context) => [
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
                ],
                onSelected: (item) {
                  switch (item) {
                    case "En rupture":
                      // Utils.pushScreen(context, RuptureDeStock(), 0.4);
                      break;
                    case "Promotion":
                      // Utils.pushScreen(context, Promotion(), 0.4);
                      break;
                    case "Modifier":
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ScannerProduitStock()),
                      // );
                      break;
                    case "Télécharger le code QR":
                      // Utils.pushScreen(context, PopUpQrCode(), 0.7);
                      break;
                    default:
                  }
                },
              ),
            )
          : Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(pi * _animation.value),
              child: GestureDetector(
                onTap: () {
                  if (_status == AnimationStatus.dismissed) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                },
                child: Card(
                  color: Color(0xFF3A3244),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Date de production",
                          style: MyTextStyles.body.copyWith(color: Colors.white),
                        ),
                        Text("26/03/2022", style: MyTextStyles.body.copyWith(color: Colors.white)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Prix", style: MyTextStyles.cardTextStyle.copyWith(color: Colors.white)),
                        Text("12\$", style: MyTextStyles.cardTextStyle.copyWith(color: Colors.white)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("A consommer avant", style: MyTextStyles.body.copyWith(color: Colors.white)),
                        Text("26/03/2022", style: MyTextStyles.body.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
