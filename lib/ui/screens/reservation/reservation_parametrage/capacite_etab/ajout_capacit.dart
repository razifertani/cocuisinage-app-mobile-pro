import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../shared/custom_button.dart';

class AjoutCapacite extends StatefulWidget {
  final Function callBack;
  List<int> newTables;
  AjoutCapacite({Key? key, required this.newTables, required this.callBack}) : super(key: key);

  @override
  State<AjoutCapacite> createState() => _AjoutCapaciteState();
}

class _AjoutCapaciteState extends State<AjoutCapacite> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
              height: 30.h,
              width: 80.w,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nombre de table à ${widget.newTables[1]} couverts",
                      style: MyTextStyles.subhead,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.newTables[1] > 1) widget.newTables[1]--;
                            setState(() {});
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (widget.newTables[0] > 1) widget.newTables[0]--;
                                setState(() {});
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.remove,
                                    color: MyColors.red,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 50,
                              child: Card(
                                child: Center(child: Text('${widget.newTables[0]}')),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.newTables[0]++;
                                setState(() {});
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.add,
                                    color: MyColors.red,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.newTables[1]++;
                            setState(() {});
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        txt: "Valider",
                        fun: (startLoading, stopLoading, btnState) {
                          // widget.tableMap["$couvert"] = pers;
                          widget.callBack();
                          Navigator.pop(context);
                        })
                  ]),
                ),
              ));
        },
      ),
    );
  }
}
