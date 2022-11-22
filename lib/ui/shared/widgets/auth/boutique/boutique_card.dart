import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BoutiqueCardAuth extends StatelessWidget {
  String name;
  String address;
  int rate;
  String imgPath;
  BoutiqueCardAuth(
      {Key? key,
      required this.name,
      required this.address,
      required this.imgPath,
      required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 35.h,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor == Colors.black
            ? null
            : Color(0xFFF1F0F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 16.h,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imgPath,
                      fit: BoxFit.fill,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: MyTextStyles.headline,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          rate,
                          (index) => const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )),
                      ...List.generate(
                          5 - rate,
                          (index) => const Icon(
                                Icons.star,
                                color: Colors.grey,
                              )),
                    ],
                  )
                ],
              ),
              Text(
                address,
                style: MyTextStyles.body.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
