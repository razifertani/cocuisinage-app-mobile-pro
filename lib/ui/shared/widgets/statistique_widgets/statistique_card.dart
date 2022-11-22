import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../../controllers/theme_controller.dart';

class ItemStatCard extends StatelessWidget {
  final String title;
  final String imgPath;
  const ItemStatCard({Key? key, required this.title, required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/stock_icons/info.png"),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AutoSizeText(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MyTextStyles.subhead,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
            width: 15.w,
            child: Image.network(
              imgPath,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "12/20",
            style: MyTextStyles.headline,
          ),
          const SizedBox(
            height: 5,
          ),
          Consumer<ThemeController>(
            builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: value.dark ? Color(0xFF0F3722) : Color(0xFFDCF5E8)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: 18.w,
                  child: Row(
                    children: [
                      Image.asset("assets/icons/grown_up.png"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "+ 11%",
                        style: MyTextStyles.subhead
                            .copyWith(color: const Color(0xFF4FD18B)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
