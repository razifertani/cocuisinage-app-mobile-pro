import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class TempPlatTable extends StatelessWidget {
  const TempPlatTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Container(
          color: const Color(0xFFECECEC),
          child: DataTable(
              columns: <DataColumn>[
                DataColumn(
                    label: Text("",
                        style: MyTextStyles.body
                            .copyWith(fontWeight: FontWeight.w600))),
                DataColumn(
                    label: Text("Nom",
                        style: MyTextStyles.body
                            .copyWith(fontWeight: FontWeight.w600))),
                DataColumn(
                    label: Text("Nbr de parts",
                        style: MyTextStyles.body
                            .copyWith(fontWeight: FontWeight.w600))),
                DataColumn(
                    label: Text("Voir",
                        style: MyTextStyles.body
                            .copyWith(fontWeight: FontWeight.w600))),
              ],
              rows: List.generate(
                3,
                (index) => DataRow(cells: [
                  DataCell(CircleAvatar(
                      radius: 5.w,
                      backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                      ))),
                  DataCell(Text(
                    "Tataki de Thon",
                    style: MyTextStyles.body,
                  )),
                  DataCell(Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_circle, color: MyColors.red)),
                      const Text('5'),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle,
                            color: MyColors.red,
                          )),
                    ],
                  )),
                  DataCell(GestureDetector(
                    child: Image.asset("assets/haccp_icons/thermométre.png"),
                  )),
                ]),
              )),
        ),
      ),
    );
  }
}
