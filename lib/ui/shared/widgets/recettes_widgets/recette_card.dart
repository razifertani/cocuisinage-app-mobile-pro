import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../screens/recette/single_recette_screen/single_rec_screen.dart';

class RecetteCard extends StatelessWidget {
  bool? mesRecettes;
  String nom;
  String imgPath;
  RecetteCard(
      {Key? key,
      this.mesRecettes = false,
      required this.imgPath,
      required this.nom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: 95.w,
        height: 32.h,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  imgPath,
                  height: 30.h,
                  width: 40.w,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: mesRecettes == false ? 32.w : 45.w,
                          child: AutoSizeText(
                            nom,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: MyTextStyles.subhead.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp.clamp(14, 18)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_rounded,
                              color: MyColors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("32")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.access_time_outlined,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("30 mn"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/fire.png",
                              height: 30,
                              width: 30,
                            ),
                            Text("450Kcal pour 100g")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: true,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleRecScreen()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: MyColors.red)),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  "Voir recette",
                                  style: MyTextStyles.subhead
                                      .copyWith(color: MyColors.red),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      mesRecettes == false
          ? Positioned(
              right: 10,
              top: 10,
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 22,
                      backgroundImage: const NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRciGGT3ENHpQ5zK27r3EIXwXwGW3_-zlEoLw&usqp=CAU"),
                      child: Material(
                          shape: const CircleBorder(),
                          clipBehavior: Clip.hardEdge,
                          color: Colors.transparent,
                          child: InkWell(onTap: () {}))),
                  Text(
                    "Alex Jhon",
                    style: MyTextStyles.body,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          4,
                          (index) => Icon(
                                Icons.star,
                                size: 10,
                              )),
                      Icon(
                        Icons.star_outline,
                        size: 10,
                      )
                    ],
                  )
                ],
              ),
            )
          : SizedBox()
    ]);
  }
}
