import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/widgets/custom_card_text_form.dart';
import 'export.dart';

class ClotureDeCaisseScreen extends StatefulWidget {
  const ClotureDeCaisseScreen({Key? key}) : super(key: key);

  @override
  State<ClotureDeCaisseScreen> createState() => _ClotureDeCaisseScreenState();
}

class _ClotureDeCaisseScreenState extends State<ClotureDeCaisseScreen> {
  int currentIndex = 0;

  switchButton(int value) {
    currentIndex = value;

    setState(() {});
  }

  String type = "Espéces";
  TextEditingController montant = TextEditingController();
  var myGroup = AutoSizeGroup();
  int selected = 0;
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Cloture de caisse",
              style: MyTextStyles.appBarTextStyle,
            ),
            centerTitle: true,
            backgroundColor: MyColors.red,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Caisse",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                InkWell(
                  onTap: () {
                    switchButton(0);
                  },
                  child: SizedBox(
                    height: 8.h,
                    width: 30.w,
                    child: Card(
                      color: currentIndex == 0 ? MyColors.red : null,
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "caisse 1",
                              style: MyTextStyles.body.copyWith(
                                color: currentIndex != 0
                                    ? MyColors.red
                                    : Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    switchButton(1);
                  },
                  child: SizedBox(
                    height: 8.h,
                    width: 30.w,
                    child: Card(
                      color: currentIndex == 1 ? MyColors.red : null,
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "caisse 2",
                              style: MyTextStyles.body.copyWith(
                                color: currentIndex != 1
                                    ? MyColors.red
                                    : Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    switchButton(2);
                  },
                  child: SizedBox(
                    height: 8.h,
                    width: 30.w,
                    child: Card(
                      color: currentIndex == 2 ? MyColors.red : null,
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "caisse 3",
                              style: MyTextStyles.body.copyWith(
                                color: currentIndex != 2
                                    ? MyColors.red
                                    : Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      "Mode de \npaiment",
                      style: MyTextStyles.body,
                      group: myGroup,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      "Nombre",
                      style: MyTextStyles.body,
                      group: myGroup,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      "Montant \ncalculé",
                      style: MyTextStyles.body,
                      group: myGroup,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      "Montant \nCompté",
                      style: MyTextStyles.body,
                      group: myGroup,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      type,
                      style: MyTextStyles.subhead,
                    ),
                    const Spacer(),
                    Text(
                      "2",
                      style: MyTextStyles.subhead,
                    ),
                    const Spacer(),
                    Text(
                      "40.00€",
                      style: MyTextStyles.subhead,
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 7.h,
                        width: 20.w,
                        child: CustomCardTextForm(
                          controller: montant,
                          hintText: "",
                        ))
                  ],
                ),
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      // color: const Color(0xFFF9F9F9),
                      child: DataTable(
                          dataRowHeight: 9.h,
                          columns: <DataColumn>[
                            DataColumn(
                                label: Text(
                              "Date et heure",
                              style: MyTextStyles.body
                                  .copyWith(fontWeight: FontWeight.w600),
                            )),
                            DataColumn(
                                label: Text(
                              "Poste",
                              style: MyTextStyles.body
                                  .copyWith(fontWeight: FontWeight.w600),
                            )),
                            DataColumn(
                                label: Text(
                              "Client",
                              style: MyTextStyles.body
                                  .copyWith(fontWeight: FontWeight.w600),
                            )),
                            DataColumn(
                                label: Text(
                              "N°ticket",
                              style: MyTextStyles.body
                                  .copyWith(fontWeight: FontWeight.w600),
                            )),
                            DataColumn(
                                label: Text(
                              "Montant",
                              style: MyTextStyles.body
                                  .copyWith(fontWeight: FontWeight.w600),
                            )),
                            DataColumn(
                                label: Text(
                              "Valeur réelle",
                              style: MyTextStyles.body
                                  .copyWith(fontWeight: FontWeight.w600),
                            )),
                            DataColumn(
                              label: PopupMenuButton(
                                padding: const EdgeInsets.all(0),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                icon: Image.asset(
                                    "assets/haccp_icons/pencil-cercled.png"),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: "Espéces",
                                    child: Text(
                                      "Espéces",
                                      style: MyTextStyles.subhead,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: "Carte Bancaire",
                                    child: Text(
                                      "Carte Bancaire",
                                      style: MyTextStyles.subhead,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: "Chéque",
                                    child: Text(
                                      "Chéque",
                                      style: MyTextStyles.subhead,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: "Chéque date",
                                    child: Text(
                                      "Chéque date",
                                      style: MyTextStyles.subhead,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: "PayPal",
                                    child: Text(
                                      "PayPal",
                                      style: MyTextStyles.subhead,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: "Acompte",
                                    child: Text(
                                      "Acompte",
                                      style: MyTextStyles.subhead,
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: "JCB",
                                    child: Text(
                                      "JCB",
                                      style: MyTextStyles.subhead,
                                    ),
                                  ),
                                ],
                                onSelected: (value) {
                                  type = value.toString();
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                          rows: List.generate(
                            3,
                            (index) => DataRow(cells: [
                              DataCell(
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "11:02:2022",
                                      style: MyTextStyles.body,
                                    ),
                                    Text(
                                      "12:00 am",
                                      style: MyTextStyles.body,
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                Text(
                                  "Caroline",
                                  style: MyTextStyles.body,
                                ),
                              ),
                              DataCell(
                                Text(
                                  "Bob Ronald",
                                  style: MyTextStyles.body,
                                ),
                              ),
                              DataCell(
                                Text(
                                  "123456789000",
                                  style: MyTextStyles.body,
                                ),
                              ),
                              DataCell(
                                Text(
                                  " 20.00€",
                                  style: MyTextStyles.body,
                                ),
                              ),
                              DataCell(
                                SizedBox(
                                    height: 7.h,
                                    width: 25.w,
                                    child: CustomCardTextForm(
                                      controller: montant,
                                      hintText: "",
                                    )),
                              ),
                              DataCell(
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: MyColors.red,
                                  value: checkedValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkedValue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ]),
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 42.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: MyColors.red),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text("Télécharger",
                          style: MyTextStyles.buttonTextStyle.copyWith(
                            color: MyColors.red,
                          )),
                    ),
                  ),
                  CustomButton(
                      txt: "Valider",
                      fun: (a, b, c) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PartagerExportCaisse()),
                        );
                      })
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
