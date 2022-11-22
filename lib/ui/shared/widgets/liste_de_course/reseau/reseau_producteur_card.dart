import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../Theme/my_text_styles.dart';

class ListeDeCourseRxProdCard extends StatelessWidget {
  const ListeDeCourseRxProdCard({Key? key}) : super(key: key);

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
              Expanded(
                child: Container(
                  height: 6.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFF3A3244),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Pris estimé', style: MyTextStyles.subhead.copyWith(color: Colors.white)), Text('12€', style: MyTextStyles.subhead.copyWith(color: Colors.white))],
                    ),
                  ),
                ),
              ),
            ])));
  }
}
