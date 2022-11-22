import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/common_product_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class ListeDeCourseIngCard extends StatelessWidget {
  const ListeDeCourseIngCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommunProductCard(
      title: "Fraise\n1 kg = 3€",
      topRightWidget: Icon(
        Icons.close,
        color: MyColors.red,
      ),
      bottomLeftWidget: Container(
        width: 17.w,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Center(
            child: AutoSizeText(
              "1.2 kg",
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      bottomRightWidget: Container(
        width: 17.w,
        decoration: BoxDecoration(
          color: MyColors.red,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Center(
            child: Text(
              "3€",
              style: MyTextStyles.subhead.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
    // return SizedBox(
    //   height: 28.h,
    //   width: 50.w,
    //   child: Stack(
    //     children: [
    //       Card(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //         elevation: 3,
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Column(
    //             children: [
    //               Flexible(
    //                 child: AutoSizeText(
    //                   "Fraise",
    //                   textAlign: TextAlign.center,
    //                   maxLines: 2,
    //                   style: MyTextStyles.subhead,
    //                 ),
    //               ),
    //               Text("1 kg = 3€"),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Image.network(
    //                 "http://assets.stickpng.com/images/580b57fbd9996e24bc43c0de.png",
    //                 height: 80,
    //                 // width: 50,
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Container(
    //                     width: 17.w,
    //                     decoration: BoxDecoration(
    //                       color: Colors.black,
    //                       borderRadius: BorderRadius.circular(15.0),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsets.symmetric(
    //                           horizontal: 10, vertical: 4),
    //                       child: Center(
    //                         child: AutoSizeText(
    //                           "1.2 kg",
    //                           maxLines: 1,
    //                           style: MyTextStyles.subhead
    //                               .copyWith(color: Colors.white),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 17.w,
    //                     decoration: BoxDecoration(
    //                       color: MyColors.red,
    //                       borderRadius: BorderRadius.circular(15.0),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsets.symmetric(
    //                           horizontal: 10, vertical: 4),
    //                       child: Center(
    //                         child: Text(
    //                           "3€",
    //                           style: MyTextStyles.subhead
    //                               .copyWith(color: Colors.white),
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Align(
    //         alignment: Alignment.topRight,
    //         child: IconButton(
    //           onPressed: () {},
    //           icon: Icon(Icons.close),
    //           color: MyColors.red,
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
