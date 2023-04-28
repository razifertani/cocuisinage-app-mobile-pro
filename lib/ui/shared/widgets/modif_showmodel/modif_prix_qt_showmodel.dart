import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../custom_button.dart';
import '../custom_card_text_form.dart';
import '../roles/delete_confirmation_popup.dart';

class ModifPrixQteShowmodel extends StatefulWidget {
  ModifPrixQteShowmodel({
    Key? key,
  }) : super(key: key);

  @override
  State<ModifPrixQteShowmodel> createState() => _ModifPrixQteShowmodelState();
}

class _ModifPrixQteShowmodelState extends State<ModifPrixQteShowmodel> {
  String dropdownvaluecateg = 'g';

  var categories = [
    'g',
    'kg',
    'ml',
    'l',
  ];
  TextEditingController qte = TextEditingController();

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
            height: 50.h,
            width: 80.w,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Modifier prix",
                  textAlign: TextAlign.center,
                  style: MyTextStyles.headline,
                ),
                const SizedBox(
                  height: 20,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                          child: Text(
                        "1 €",
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Quantité",
                  textAlign: TextAlign.center,
                  style: MyTextStyles.headline,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 40.w,
                        child: CustomCardTextForm(
                            controller: qte, hintText: "Quantité")),
                    SizedBox(
                      width: 20.w,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
                CustomButton(
                    txt: "Valider",
                    fun: (a, b, c) {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (_) => ConfirmationShowmodel(
                                title: "voulez-vous vraiment fixer ce prix ?",
                              ));
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
