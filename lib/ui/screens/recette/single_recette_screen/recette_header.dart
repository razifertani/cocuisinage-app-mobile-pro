import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';

import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../shared/widgets/roles/delete_confirmation_popup.dart';

class RecHeader extends StatelessWidget {
  const RecHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.network(
                "https://img-3.journaldesfemmes.fr/cLXww7v_1b8pYQsdOe5TkZZ2jj4=/1500x/smart/09ca38eb418e4ba4b8d5732c442a775b/ccmcms-jdf/10861244.jpg",
                fit: BoxFit.cover,
                height: 100.w < 500 ? 35.h : 40.h,
                width: double.infinity,
              ),
            ),
            Container(
              height: 100.w < 480 ? 35.h : 40.h,
              //height: (20.sp).clamp(220.0, 500.0),
              margin: EdgeInsets.all(3.w),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: <Color>[
                    Color(0xFFFBC06D),
                    Color(0xFFF3939A),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 6.h,
                    ),
                    AutoSizeText(
                      "Oeuf cocotte",
                      style: MyTextStyles.headline,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              Icons.timelapse,
                              color: Colors.white,
                            ),
                            Text("10 mn"),
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => ConfirmationShowmodel(
                                            title:
                                                "voulez-vous vraiment ajouter cette recette a votre liste",
                                          ));
                                },
                                child: Material(
                                    shape: const CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.add,
                                        color: MyColors.red,
                                        size: 30,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text("Ajouter ",
                                  textAlign: TextAlign.center,
                                  style: MyTextStyles.body)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => ConfirmationShowmodel(
                                            title:
                                                "voulez-vous vraiment déstocker cette recette ",
                                          ));
                                },
                                child: Material(
                                    shape: const CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/recette_icons/pieces.png",
                                        color: Colors.redAccent,
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Déstocker",
                                textAlign: TextAlign.center,
                                style: MyTextStyles.body,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => ConfirmationShowmodel(
                                            title:
                                                "voulez-vous télécharger la recette ?",
                                          ));
                                },
                                child: Material(
                                  shape: const CircleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      'assets/recette_icons/imprimante.png',
                                      width: 24,
                                      height: 24,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              FittedBox(
                                child: Text("Imprimer",
                                    textAlign: TextAlign.center,
                                    style: MyTextStyles.body),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 100.w < 500 ? 27.h : 31.h,
          left: 100.w < 500 ? 39.w : 42.w,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 100.w < 450 ? 11.5.w : 7.w,
            child: CircleAvatar(
                radius: 100.w < 450 ? 11.w : 6.5.w,
                backgroundImage: const NetworkImage(
                  "https://img-3.journaldesfemmes.fr/cLXww7v_1b8pYQsdOe5TkZZ2jj4=/1500x/smart/09ca38eb418e4ba4b8d5732c442a775b/ccmcms-jdf/10861244.jpg",
                ),
                child: Material(
                    shape: const CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                    child: InkWell(onTap: () {}))),
          ),
        ),
      ],
    );
  }
}
