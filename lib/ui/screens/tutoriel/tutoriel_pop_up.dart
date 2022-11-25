import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';

class TutorielPopUp extends StatefulWidget {
  int? numberOfPages = 1;
  String title;
  String description;
  String? secTitle;
  String? thirdTitle;
  String? fourthTitle;
  String? secDescription;

  String? thirdDescription;
  String? fourthDescription;

  TutorielPopUp(
      {Key? key,
      this.numberOfPages,
      required this.title,
      required this.description,
      this.secTitle,
      this.thirdTitle,
      this.secDescription,
      this.thirdDescription,
      this.fourthDescription})
      : super(key: key);

  @override
  State<TutorielPopUp> createState() => _TutorielPopUpState();
}

class _TutorielPopUpState extends State<TutorielPopUp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 40.h,
            width: 85.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.question_mark,
                    color: MyColors.red,
                    size: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 25.h,
                    child: Column(
                      children: [
                        if (currentIndex == 0)
                          Text(
                            widget.title,
                            style: MyTextStyles.headline
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        if (currentIndex == 1)
                          Text(
                            widget.secTitle ?? widget.title,
                            style: MyTextStyles.headline
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        if (currentIndex == 2)
                          Text(
                            widget.thirdTitle ?? widget.title,
                            style: MyTextStyles.headline
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        if (currentIndex == 3)
                          Text(
                            widget.fourthTitle ?? widget.title,
                            style: MyTextStyles.headline
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (currentIndex == 0)
                          Flexible(
                            child: AutoSizeText(
                              widget.description,
                              style: MyTextStyles.body,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        if (currentIndex == 1)
                          Flexible(
                            child: AutoSizeText(
                              widget.secDescription ?? "",
                              style: MyTextStyles.body,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        if (currentIndex == 2)
                          Flexible(
                            child: AutoSizeText(
                              widget.thirdDescription ?? "",
                              style: MyTextStyles.body,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        if (currentIndex == 3)
                          Flexible(
                            child: AutoSizeText(
                              widget.fourthDescription ?? "",
                              style: MyTextStyles.body,
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                  (widget.numberOfPages ?? 1) > 1
                      ? Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  currentIndex = (currentIndex - 1) %
                                      (widget.numberOfPages ?? 1);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                )),
                            const Spacer(),
                            ...List.generate(
                                widget.numberOfPages ?? 1,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: Container(
                                        height: 14,
                                        width: 14,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: currentIndex == index
                                              ? MyColors.red
                                              : Colors.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    )),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  currentIndex = (currentIndex + 1) %
                                      (widget.numberOfPages ?? 1);
                                  setState(() {});
                                  print(currentIndex);
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ))
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
