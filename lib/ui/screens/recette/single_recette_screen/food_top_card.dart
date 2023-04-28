import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import 'creator/creator_screen.dart';

class FoodTopCard extends StatelessWidget {
  const FoodTopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatorScreen()),
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(3.w),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 100.w < 500 ? 24 : 34,
                  backgroundColor: Colors.white,
                  child: const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage("assets/icons/cocuisinage.png"))),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("co-cuisinage", style: MyTextStyles.subhead),
                  Text(
                    "Paris",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 10.sp.clamp(10, 17)),
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                        padding: EdgeInsets.all(1.5.w),
                        decoration: BoxDecoration(
                            color: MyColors.red, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.favorite_outline,
                          size: 25,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    ' 2 Likes',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 9.sp.clamp(10, 17)),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(1.8.w),
                    decoration: BoxDecoration(
                        color: MyColors.red, shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/recette_icons/chef_blanc.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '2 Recettes',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 9.sp.clamp(10, 17)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
