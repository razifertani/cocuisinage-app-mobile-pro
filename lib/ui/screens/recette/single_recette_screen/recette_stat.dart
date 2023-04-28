import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/porte_monnaie_widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/statistique_widgets/chart_widget.dart';

class RecetteStat extends StatefulWidget {
  RecetteStat({Key? key}) : super(key: key);

  @override
  State<RecetteStat> createState() => _RecetteStatState();
}

class _RecetteStatState extends State<RecetteStat> {
  String dropdownvaluecateg = 'Annuels';

  var categories = [
    'Annuels',
    'Mensuels',
    'Categorie 3',
    'Categorie 4',
    'Categorie 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Historique",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
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
            height: 10,
          ),
          const LineChartSample7(),
        ],
      ),
    );
  }
}
