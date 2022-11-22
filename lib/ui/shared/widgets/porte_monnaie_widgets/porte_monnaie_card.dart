import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class PorteMonnaieCard extends StatelessWidget {
  String title;
  double price;
  Function cardFunction;
  String imgPath;
  bool? havePopup;
  PorteMonnaieCard(
      {Key? key,
      required this.title,
      required this.price,
      this.havePopup,
      required this.cardFunction,
      required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => cardFunction(),
      child: SizedBox(
        height: 28.h,
        width: 55.w,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: Center(
                child: Stack(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(height: 12.h, child: Image.asset(imgPath)),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 4.h,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: AutoSizeText(
                              title,
                              maxLines: 1,
                              style: MyTextStyles.cardTextStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$price €",
                              style: MyTextStyles.cardTextStyle.copyWith(
                                  color: MyColors.red,
                                  fontWeight: FontWeight.w600)),
                        )
                      ]),
                  havePopup ?? false
                      ? Positioned(
                          right: 5,
                          top: 10,
                          child: PopupMenuButton(
                            padding: const EdgeInsets.all(0),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
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
                                value: "Virer de l’argent vers mon solde",
                                child: Text(
                                  "Virer de l’argent vers mon solde",
                                  style: MyTextStyles.body,
                                ),
                              ),
                              PopupMenuItem(
                                value: "Transfert le solde vers ma banque",
                                child: Text(
                                  "Transfert le solde vers ma banque",
                                  style: MyTextStyles.body,
                                ),
                              ),
                            ],
                            onSelected: (item) {
                              switch (item) {
                                case "En rupture":
                                  break;
                                case "Promotion":
                                  break;
                                default:
                              }
                            },
                          ),
                        )
                      : SizedBox(),
                ]),
              ),
            )),
      ),
    );
  }
}
