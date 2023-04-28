import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_text_styles.dart';

class EtapeCard extends StatelessWidget {
  const EtapeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 8.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mélanger les fruits",
              style: MyTextStyles.headline,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 26,
                              backgroundImage: const NetworkImage(
                                  "https://www.conservation-nature.fr/wp-content/uploads/visuel/fruit/shutterstock_192308075.jpg"),
                              child: Material(
                                  shape: const CircleBorder(),
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.transparent,
                                  child: InkWell(onTap: () {}))),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Fraise",
                            style: MyTextStyles.headline,
                          ),
                          const Spacer(),
                          Text(
                            "2g",
                            style: MyTextStyles.headline,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20.h,
                    width: 100.w,
                    child: Image.network(
                      "https://assets.afcdn.com/recipe/20210215/117981_w1024h768c1cx2652cy2652.webp",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Temps : ",
                          style: MyTextStyles.subhead,
                        ),
                        Text(
                          "5 mn",
                          style: MyTextStyles.subhead,
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
