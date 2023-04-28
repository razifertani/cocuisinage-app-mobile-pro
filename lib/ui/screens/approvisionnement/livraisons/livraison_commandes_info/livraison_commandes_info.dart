import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_text_styles.dart';
import '../../../../shared/divider.dart';
import 'livraison_commandes_info_action.dart';

class LivraisonCommandeInfo extends StatelessWidget {
  const LivraisonCommandeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const MyDivider(),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xFFECECEC),
                  ),
                  child: DataTable(
                      columns: <DataColumn>[
                        DataColumn(
                            label: Text(
                          "",
                          style: MyTextStyles.body
                              .copyWith(fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          "Produit",
                          style: MyTextStyles.body
                              .copyWith(fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          "Quantité",
                          style: MyTextStyles.body
                              .copyWith(fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          "Prix unitaire",
                          style: MyTextStyles.body
                              .copyWith(fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          "Prix ",
                          style: MyTextStyles.body
                              .copyWith(fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          "action",
                          style: MyTextStyles.body
                              .copyWith(fontWeight: FontWeight.w600),
                        )),
                      ],
                      rows: List.generate(
                        1,
                        (index) => DataRow(cells: [
                          DataCell(Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: CircleAvatar(
                                radius: 5.w,
                                backgroundImage: const NetworkImage(
                                  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                                )),
                          )),
                          DataCell(
                            Text(
                              "tomates",
                              style: MyTextStyles.body,
                            ),
                          ),
                          DataCell(
                            Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    '1.2 kg',
                                    style: MyTextStyles.body,
                                  ),
                                )),
                          ),
                          DataCell(
                            Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFCC669),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    '1.2€',
                                    style: MyTextStyles.body,
                                  ),
                                )),
                          ),
                          DataCell(
                            Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xFFB6B9F5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    '1.2€',
                                    style: MyTextStyles.body,
                                  ),
                                )),
                          ),
                          DataCell(
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (_) =>
                                        const LivraisonCommandeInfoAction());
                              },
                              child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF4FD18B),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Text(
                                      '....',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ),
                        ]),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
