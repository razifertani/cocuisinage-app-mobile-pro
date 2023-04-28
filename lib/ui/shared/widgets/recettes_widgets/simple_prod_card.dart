import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_text_styles.dart';

class SimpleProdCard extends StatelessWidget {
  String nom;
  String imgPath;
  SimpleProdCard({Key? key, required this.nom, required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 45.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  height: 20.h,
                  child: Image.network(
                    imgPath,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                nom,
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
