import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/caisse/calculator.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';

import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/caisse_widgets/reduction_show_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../shared/widgets/caisse_widgets/caisse_stat_card.dart';
import '../reservation/plan_de_table/plan_de_table_externe.dart';
import 'cloture_de_caisse/cloture_de_caisse_screen.dart';

class CaisseCalculator extends StatefulWidget {
  const CaisseCalculator({Key? key}) : super(key: key);

  @override
  State<CaisseCalculator> createState() => _CaisseCalculatorState();
}

class _CaisseCalculatorState extends State<CaisseCalculator> {
  String dropdownvaluecateg = 'Carte bleu';
  List plats = [
    {
      "1": ["1/2 salade", "2/2 Salade"]
    },
    {
      "2": ["1/2 salade", "2/2 Salade"]
    },
    {
      "3": ["1/2 salade", "2/2 Salade"]
    }
  ];

  var categories = [
    'Carte bleu',
    'Espéces',
    'Cheque',
    'Paypal',
  ];
  bool isPayed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ma caisse",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ma caisse",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PlanDeTableScreenExterne()));
                      },
                      child: CaisseStatCard(
                          title: "Plan de table", content: "25")),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClotureDeCaisseScreen()));
                      },
                      child: CaisseStatCard(
                          title: "Cloture de caisse", content: "25"))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Tickets en cours  : 4",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            Card(
              child: ExpansionTile(
                title: Text(
                  "Ticket 1",
                  style: MyTextStyles.subhead,
                ),
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      // _listKeys[index] = GlobalKey<AnimatedListState>();
                      return ExpansionTile(
                        title: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: MyColors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  plats[index].keys.first,
                                  style: MyTextStyles.body,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Salade de fruit",
                                style: MyTextStyles.headline),
                          ],
                        ),
                        trailing: plats[index].values.first.isNotEmpty
                            ? Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffF6D6DA),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      "assets/icons/percentage-circle.png"),
                                ))
                            : SizedBox(
                                width: 30.w,
                                child: Row(
                                  children: [
                                    Text(
                                      "Annuler",
                                      style: MyTextStyles.body.copyWith(
                                          color: MyColors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffF6D6DA),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                plats.removeAt(index);
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.done,
                                                color: MyColors.red,
                                              ),
                                            )))
                                  ],
                                ),
                              ),
                        children: [
                          Divider(
                            endIndent: 10,
                            indent: 10,
                            color: Colors.grey,
                            thickness: 0.8,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8.0),
                            itemCount: plats[index].values.first.length,
                            itemBuilder: (
                              context,
                              ind,
                            ) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          plats[index].values.first[ind],
                                          style: MyTextStyles.body
                                              .copyWith(color: Colors.grey),
                                        ),
                                        SizedBox(
                                            height: 6.h,
                                            width: 100,
                                            child: CustomButton(
                                                txt: "Payer",
                                                fun: (p0, p1, p2) {
                                                  plats[index]
                                                      .values
                                                      .first
                                                      .removeAt(ind);
                                                  setState(() {});
                                                }))
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: plats.length,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40.w,
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
                CustomButton(
                    txt: "Payer",
                    fun: (a, b, c) {
                      showDialog(
                        context: context,
                        builder: (context) => ReductionShowModel(),
                      );
                    })
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 60.h, child: SimpleCalculator())
          ],
        ),
      ),
    );
  }
}
