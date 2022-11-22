import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/serach_bar/search_bar.dart';
import '../../../shared/widgets/statistique_widgets/chart_widget.dart';
import '../../../shared/widgets/statistique_widgets/rec_stat_card.dart';
import '../../../shared/widgets/statistique_widgets/statistique_card.dart';

class StatisPlatScreen extends StatefulWidget {
  const StatisPlatScreen({Key? key}) : super(key: key);

  @override
  State<StatisPlatScreen> createState() => _StatisPlatScreenState();
}

class _StatisPlatScreenState extends State<StatisPlatScreen> {
  TextEditingController rech = TextEditingController();

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(controller: rech, hintText: "rechercher"),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mes plats",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 29.h,
              child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: 4,
                  itemBuilder: (BuildContext ctx, index) {
                    return ItemStatCard(
                      title: "test",
                      imgPath:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpSp8G9JL9Z8fzbGLS4us2jIL-hDhizH5z-w&usqp=CAU",
                    );
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Historiques",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
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
            const SizedBox(
              height: 20,
            ),
            const LineChartSample7(),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Tableau de cout de revient",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            RecStatCard(
              nomDeRec: "Tomate de salade",
              prix: "Prix de VPP : 12€",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
