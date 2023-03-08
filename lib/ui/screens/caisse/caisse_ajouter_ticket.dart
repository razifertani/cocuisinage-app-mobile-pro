import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/boutique_widgets/categorie_pop_up_card.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/caisse_widgets/caisse_card.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/food_pop_up/plat_pop_up.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/food_pop_up/suite_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../../utils/utils.dart';
import '../../shared/widgets/food_pop_up/produit_pop_up.dart';

class CaisseAjouterTicketScreen extends StatefulWidget {
  final Function? callBack;
  const CaisseAjouterTicketScreen({Key? key, this.callBack}) : super(key: key);

  @override
  State<CaisseAjouterTicketScreen> createState() =>
      _CaisseAjouterTicketScreenState();
}

class _CaisseAjouterTicketScreenState extends State<CaisseAjouterTicketScreen> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  bool categIsEmpty = true;
  bool suiteVisible = false;
  int counter = 0;
  String dropdownvaluecateg = 'Categorie 1';

  var categories = [
    'Categorie 1',
    'Categorie 2',
    'Categorie 3',
    'Categorie 4',
    'Categorie 5',
  ];
  List ordres = [];
  List suites = [];
  String categName = "Catégorie";
  List<Map> categs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        openCloseDial: isDialOpen,
        overlayOpacity: 0,
        activeChild: Icon(
          Icons.close,
          color: MyColors.red,
        ),
        icon: Icons.add,
        iconTheme: IconThemeData(color: MyColors.red, size: 30),
        backgroundColor: Colors.white,
        buttonSize: const Size(65, 65),
        childrenButtonSize: const Size(70, 70),
        children: [
          SpeedDialChild(
            child: Image.asset("assets/icons/save-add.png"),
            onTap: () {
              isDialOpen.value = false;
              Utils.pushScreen(context, SuitePopUp(
                callBack: () {
                  suiteVisible = true;

                  setState(() {});
                  Navigator.of(context).pop();
                },
              ), 0.6);
            },
          ),
          SpeedDialChild(
              onTap: () {
                isDialOpen.value = false;
                Utils.pushScreen(context, PlatPopUp(
                  callBack: () {
                    print("object");
                    categIsEmpty = false;
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                ), 0.7);
              },
              child: Image.asset(
                "assets/icons/plate.png",
                height: 30,
                width: 30,
              )),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "Créer une ticket",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
        actions: [
          IconButton(
              onPressed: () {
                widget.callBack?.call();
                Navigator.pop(context);
              },
              icon: Image.asset("assets/icons/tick-circle.png"))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Créer une ticket puis envoyer au cuisine",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ticket",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: AutoSizeText(
                    "Numéro du tickets :",
                    style: MyTextStyles.headline,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (counter > 0) counter--;
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
                      width: 80,
                      height: 50,
                      child: Card(
                        child: Center(child: Text('$counter')),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        counter++;
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
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "L'ordre",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            ordres.isEmpty
                ? Center(
                    child: Column(
                      children: [
                        Image.asset("assets/images/menu-board.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Cette ticket est vide! ",
                          style: MyTextStyles.headline
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      ...List.generate(
                          ordres.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: MyColors.grey,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Center(
                                        child: Text(
                                          '${ordres[index]['quantite']}',
                                          style: MyTextStyles.subhead,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      ordres[index]['orderName'],
                                      style: MyTextStyles.subhead,
                                    )
                                  ],
                                ),
                              )),
                    ],
                  ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: suiteVisible,
              child: Text(
                "suite",
                style: MyTextStyles.subhead
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            ),
            ...List.generate(
                suites.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: MyColors.grey,
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text(
                                '${suites[index]['quantite']}',
                                style: MyTextStyles.subhead,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            suites[index]['orderName'],
                            style: MyTextStyles.subhead,
                          )
                        ],
                      ),
                    )),
            Text(
              categName,
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            Visibility(
              visible: !categIsEmpty,
              child: GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100.w > 600 ? 300 : 200,
                  childAspectRatio: 0.95,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (suiteVisible) {
                      suites.add({
                        "orderName": "Coca-cola",
                        "quantite": 1,
                      });
                    } else {
                      ordres.add({
                        "orderName": "Coca-cola",
                        "quantite": 1,
                      });
                    }

                    setState(() {});
                  },
                  child: CaisseItemCard(
                    title: "Coca-Cola",
                    price: "3€",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
