import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../success_show_model/success_show_model.dart';

class ConfirmationShowmodel extends StatelessWidget {
  String title;
  String sucessDescription;
  ConfirmationShowmodel(
      {Key? key, required this.title, required this.sucessDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Builder(builder: (context) {
          return SizedBox(
              height: 30.h,
              width: 80.w,
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: MyTextStyles.headline,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 7.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: MyColors.red),
                              color: Colors.white),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("non",
                                style: MyTextStyles.buttonTextStyle
                                    .copyWith(color: MyColors.red)),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (_) => SuccessShowmodel(
                                    description: sucessDescription,
                                  ));
                        },
                        child: Container(
                          height: 7.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: MyColors.red),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("oui",
                                style: MyTextStyles.buttonTextStyle.copyWith(
                                  color: Colors.white,
                                )),
                          )),
                        ),
                      ),
                    ),
                  ],
                )
              ]));
        }));
  }
}
