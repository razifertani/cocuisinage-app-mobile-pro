import 'package:cocuisinage_app_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RxFournisseurCard extends StatelessWidget {
  const RxFournisseurCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30.h,
        width: 70.w,
        child: Card(
            // color: Colors.amber,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Maraicher Marcel",
                  style: MyTextStyles.headline,
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "3 Allée Beaumarchés, 75001 PARIS",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: MyTextStyles.subhead.copyWith(fontSize: 11.sp.clamp(12, 18)),
                    ),
                    Text(
                      "06 72 66 17 21",
                      textAlign: TextAlign.center,
                      style: MyTextStyles.subhead.copyWith(fontSize: 12.sp.clamp(14, 18)),
                    ),
                    Text(
                      "dupont.maraicher@gmail.com",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: MyTextStyles.subhead.copyWith(fontSize: 12.sp.clamp(14, 18)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 6.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFF3A3244),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Image.asset("assets/reseau_icons/email.png"), Text('email', style: MyTextStyles.body.copyWith(color: Colors.white))],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: MyColors.red,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                        Image.asset("assets/reseau_icons/telephone.png"),
                        Text(
                          'sms',
                          style: MyTextStyles.body.copyWith(color: Colors.white),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ])));
  }
}
