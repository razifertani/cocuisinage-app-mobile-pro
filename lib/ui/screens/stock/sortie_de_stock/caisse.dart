import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/stock/sortie_de_stock/popup_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/utils.dart';
import '../../../shared/widgets/planning_widgets/horizontal_calendar.dart';
import '../../../shared/widgets/stock/sortie_de_stock/menu_card.dart';
import 'item_settings/creer_etiquette.dart';

class CaisseSortieDeStock extends StatefulWidget {
  const CaisseSortieDeStock({Key? key}) : super(key: key);

  @override
  State<CaisseSortieDeStock> createState() => _CaisseSortieDeStockState();
}

class _CaisseSortieDeStockState extends State<CaisseSortieDeStock> {
  int currentIndex = 0;

  switchTag(int value) {
    currentIndex = value;
    setState(() {});
  }

  String dropdownvaluecateg = 'Categorie 1';

  var categories = [
    'Categorie 1',
    'Categorie 2',
    'Categorie 3',
    'Categorie 4',
    'Categorie 5',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const HorizontalCalendar(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 45.w,
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
                  width: 45.w,
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
            GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.82,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                      onTap: () {
                        Utils.pushScreen(
                            context, const PopUpScreenSortieDeStock(), 0.5);
                      },
                      child: SortieDestockMenuCard(
                        imgPath: "assets/images/box.png",
                        title: "title",
                      ));
                  ;
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
