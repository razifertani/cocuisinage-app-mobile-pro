import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../shared/widgets/carte/row_plat_widget.dart';
import '../../../../shared/widgets/modif_showmodel/confirmation_showmodel.dart';

class IngManquantes extends StatelessWidget {
  IngManquantes({Key? key}) : super(key: key);
  var myGroup = AutoSizeGroup();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => ConfirmationShowmodel(
                    sucessDescription:
                        "2 portions ont été ajoutées avec succées",
                    title:
                        "voulez-vous ajouter 2 portions a votre liste de course ?",
                  ));
        },
        icon: const Icon(
          Icons.add_circle,
          color: Colors.white,
          size: 30,
        ),
        label: Text(
          'Ajouter à ma liste de course',
          style: MyTextStyles.body.copyWith(color: Colors.white),
        ),
        backgroundColor: MyColors.red,
      ),
      appBar: AppBar(
          title: Text(
            "Ingrédients",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Ingrédients manquants",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const RowPlatWidget(),
              FittedBox(
                child: DataTable(
                    columnSpacing: 40,
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) {
                        return Theme.of(context).scaffoldBackgroundColor ==
                                Colors.black
                            ? Color(0xFF323744).withOpacity(0.6)
                            : Color(0xFFCACED8).withOpacity(0.46);
                      },
                    ),
                    columns: <DataColumn>[
                      const DataColumn(label: SizedBox()),
                      DataColumn(
                          label:
                              Text("Ingrédient", style: MyTextStyles.subhead)),
                      DataColumn(
                          label: Text("Quantité a commander",
                              style: MyTextStyles.subhead)),
                    ],
                    rows: List.generate(
                      3,
                      (index) => DataRow(cells: [
                        DataCell(Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CircleAvatar(
                              radius: 5.w,
                              backgroundImage: const NetworkImage(
                                  "https://mapetiteassiette.com/wp-content/uploads/2021/08/800x600-tomate-min.png")),
                        )),
                        DataCell(
                          Text(
                            "tomates",
                            style: MyTextStyles.body,
                          ),
                        ),
                        DataCell(
                          Text(
                            "20 kg",
                            style: MyTextStyles.body,
                          ),
                        ),
                      ]),
                    )),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
