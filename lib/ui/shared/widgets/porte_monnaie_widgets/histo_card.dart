import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../../Theme/my_text_styles.dart';

class PorteMonnaieHistoCard extends StatefulWidget {
  const PorteMonnaieHistoCard({Key? key}) : super(key: key);

  @override
  State<PorteMonnaieHistoCard> createState() => _PorteMonnaieHistoCardState();
}

class _PorteMonnaieHistoCardState extends State<PorteMonnaieHistoCard> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  var myGroup = AutoSizeGroup();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: AutoSizeText(
                DateFormat.yMd('fr').format(DateTime.now()),
                maxLines: 1,
                style: MyTextStyles.body.copyWith(color: Colors.grey),
                group: myGroup,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
                child: AutoSizeText(
              "Plat",
              style: MyTextStyles.body,
              group: myGroup,
            )),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: AutoSizeText(
                "Anne Montgermont".replaceFirst(" ", "\n"),
                maxLines: 2,
                textAlign: TextAlign.center,
                style: MyTextStyles.body,
                group: myGroup,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF3A3244),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "123 €",
                  style: MyTextStyles.body.copyWith(color: Colors.white),
                ),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFFCC669),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(Icons.download_outlined))),
          ],
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Livraison a domicile, 13 rue du port, 75000 PARIS",
                    style: MyTextStyles.subhead,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                          radius: 26,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                          )),
                      Text(
                        "2",
                        style: MyTextStyles.body,
                      ),
                      Text(
                        "Salade de fruit",
                        style: MyTextStyles.body,
                      ),
                      Text(
                        "123€",
                        style: MyTextStyles.body,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
