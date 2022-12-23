import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/planning_widgets/horizontal_calendar.dart';
import 'package:flutter/material.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class HistoriqueDeTable extends StatelessWidget {
  const HistoriqueDeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Plan de table",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalCalendar(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Historique du table numéro 012",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text('Client',
                          style: MyTextStyles.headline
                              .copyWith(fontWeight: FontWeight.w600))),
                  DataColumn(
                      label: Text('Date',
                          style: MyTextStyles.headline
                              .copyWith(fontWeight: FontWeight.w600))),
                  DataColumn(
                      label: Text('Nb personne',
                          style: MyTextStyles.headline
                              .copyWith(fontWeight: FontWeight.w600))),
                ],
                rows: [
                  ...List.generate(
                    4,
                    (index) => DataRow(cells: [
                      DataCell(Text(
                        'M.Bruneau',
                        style: MyTextStyles.body,
                      )),
                      DataCell(Text(
                        '14/12/2022',
                        style: MyTextStyles.body,
                      )),
                      DataCell(Text(
                        '4',
                        style: MyTextStyles.body,
                      )),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
