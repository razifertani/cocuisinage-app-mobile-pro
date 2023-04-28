import 'package:flutter/material.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../../utils/utils.dart';
import '../../../screens/approvisionnement/livraisons/livraison_command_detail_screen.dart';
import '../../../screens/approvisionnement/livraisons/livraison_commandes_action.dart';

class CommandesLivraisonCard extends StatelessWidget {
  CommandesLivraisonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Container(
        width: double.infinity,
        // color: const Color(0xFFECECEC),
        child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
              (states) {
                return Color(0xFFBAB8BD);
              },
            ),
            columns: <DataColumn>[
              DataColumn(
                  label: Text(
                "Fournisseur",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
              DataColumn(
                  label: Text(
                "Action",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
              DataColumn(
                  label: Text(
                "Details",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
            ],
            rows: List.generate(
              3,
              (index) => DataRow(cells: [
                DataCell(
                  Text(
                    "Sacha Bonner",
                    style: MyTextStyles.body,
                  ),
                ),
                DataCell(
                  InkWell(
                    onTap: () {
                      Utils.pushScreen(
                          context, LivraisonCommandeAction(), 0.45);
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF4FD18B),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            '....',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ),
                DataCell(GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LivraisonCommandDetailScreen()),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/info.png",
                  ),
                )),
              ]),
            )),
      ),
    );
  }
}
