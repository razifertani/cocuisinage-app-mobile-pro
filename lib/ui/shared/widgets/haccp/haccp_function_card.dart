import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HaccpFuncCard extends StatelessWidget {
  String imgPath;
  String title;
  String description;
  Function function;
  HaccpFuncCard({Key? key, required this.imgPath, required this.title, required this.description, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 30.h,
        width: 90.w,
        child: InkWell(
          onTap: () {
            function();
          },
          child: Card(
            elevation: 5,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            )),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 8.h,
                    child: Image.asset(imgPath),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      description,
                      textAlign: TextAlign.center,
                      style: MyTextStyles.body,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
