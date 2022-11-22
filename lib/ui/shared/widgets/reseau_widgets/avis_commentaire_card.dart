import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AvisCommentaireCard extends StatelessWidget {
  const AvisCommentaireCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      width: 95.w,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 28,
                  backgroundImage: const NetworkImage(
                    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                  ),
                  child: Material(shape: const CircleBorder(), clipBehavior: Clip.hardEdge, color: Colors.transparent, child: InkWell(onTap: () {}))),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
                child: SizedBox(
                  height: 16.h,
                  width: 75.w,
                  child: Card(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "JohnD",
                                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  ...List.generate(
                                      4,
                                      (index) => const Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.white,
                                          )),
                                  const Icon(
                                    Icons.star,
                                    size: 14,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "Trés bon accueil et produits de trés bonne qualité",
                            style: MyTextStyles.body,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Align(alignment: Alignment.bottomRight, child: Image.asset("assets/reseau_icons/send_red.png")),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "7 juin 2022",
                style: MyTextStyles.body.copyWith(color: Colors.grey),
              ))
        ],
      ),
    );
  }
}
