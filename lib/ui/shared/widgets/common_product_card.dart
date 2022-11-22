import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';

class CommunProductCard extends StatelessWidget {
  String title;
  Widget? topRightWidget;
  Widget? topLeftWidget;
  Widget? bottomRightWidget;
  Widget? bottomLeftWidget;
  CommunProductCard(
      {Key? key,
      required this.title,
      this.bottomLeftWidget,
      this.bottomRightWidget,
      this.topLeftWidget,
      this.topRightWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 2.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                topLeftWidget ?? const SizedBox(),
                Flexible(
                  child: AutoSizeText(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: MyTextStyles.subhead,
                  ),
                ),
                topRightWidget ?? const SizedBox(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Image.network(
              "http://assets.stickpng.com/images/580b57fbd9996e24bc43c0de.png",
              height: 80,
              // width: 50,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomLeftWidget ?? const SizedBox(),
                bottomRightWidget ?? const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
