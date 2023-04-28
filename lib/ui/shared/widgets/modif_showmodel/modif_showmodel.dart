import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../custom_button.dart';
import '../roles/delete_confirmation_popup.dart';

class ModifShowModel extends StatefulWidget {
  String title;
  String content;
  bool? haveQte;
  Function function;

  ModifShowModel(
      {Key? key,
      required this.title,
      required this.content,
      required this.function,
      this.haveQte})
      : super(key: key);

  @override
  State<ModifShowModel> createState() => _ModifShowModelState();
}

class _ModifShowModelState extends State<ModifShowModel> {
  String dropdownvaluecateg = 'g';

  var categories = [
    'g',
    'kg',
    'ml',
    'l',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 35.h,
            width: 80.w,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: MyTextStyles.headline,
                ),
                const SizedBox(
                  height: 20,
                ),
                widget.haveQte ?? false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFECECEC),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 4),
                                    child: Text(
                                      widget.content,
                                      style: MyTextStyles.headline,
                                    ),
                                  ),
                                ),
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
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 25.w,
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  value: dropdownvaluecateg,
                                  isExpanded: true,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: categories.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvaluecateg = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Center(
                                child: Text(
                              widget.content,
                              style: MyTextStyles.headline,
                            )),
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
                const Spacer(),
                CustomButton(
                    txt: "Valider",
                    fun: (a, b, c) {
                      widget.function();

                      if (widget.haveQte != null) {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (_) => ConfirmationShowmodel(
                                  title: "voulez-vous vraiment fixer ce prix ?",
                                ));
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
