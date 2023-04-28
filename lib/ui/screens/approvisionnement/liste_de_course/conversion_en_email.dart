import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_text_styles.dart';

import '../../../shared/custom_button.dart';

class ConversionEnEmail extends StatelessWidget {
  const ConversionEnEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 50.h,
            width: 85.w,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Maraicher Marcel",
                    style: MyTextStyles.headline,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Totale à payer",
                        style: MyTextStyles.headline,
                      ),
                      Text(
                        "54.00€",
                        style: MyTextStyles.headline,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                    3,
                    (index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1 Coca cola ",
                                style: MyTextStyles.subhead,
                              ),
                              Text(
                                "13,20€",
                                style: MyTextStyles.subhead,
                              ),
                              Text(
                                "12 kg",
                                style: MyTextStyles.subhead,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 2,
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CustomButton(
                      fun: (a, b, c) {
                        Navigator.pop(context);
                      },
                      txt: "Valider",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
