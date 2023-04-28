import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class RowPlatWidget extends StatelessWidget {
  const RowPlatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        FittedBox(
          child: Row(
            children: [
              const CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(
                      "https://mapetiteassiette.com/wp-content/uploads/2021/08/800x600-tomate-min.png")),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Tataki de Thon",
                style: MyTextStyles.headline,
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.remove,
                          color: MyColors.red,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset("assets/icons/groupe_person.png"),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          width: 14.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFECECEC),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(child: Text("1")),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add,
                          color: MyColors.red,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
