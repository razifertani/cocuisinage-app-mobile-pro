import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/commande.dart';

import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/commandes_widgets/expansiontile_widget.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/theme_controller.dart';
import 'commandes_details/commandes_details_screen.dart';

class CommandesConfirm extends StatefulWidget {
  const CommandesConfirm({Key? key}) : super(key: key);

  @override
  State<CommandesConfirm> createState() => _CommandesConfirmState();
}

class _CommandesConfirmState extends State<CommandesConfirm> {
  List<Commande> commandes = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      commandes = Globals.profile.getEstablishment().commandes.where((element) => element.status == 1).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<ThemeController>(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Mes commandes",
              style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ExpansionTileCommandWidget(
            title: "A domicile",
            rows: [
              ...List.generate(
                commandes.length,
                (index) => DataRow(
                  cells: [
                    DataCell(
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFD43347).withOpacity(0.16),
                        ),
                        height: 5.h,
                        width: 20.w,
                        child: Center(
                            child: Text(
                          "${commandes[index].montant} €",
                          style: MyTextStyles.body.copyWith(color: p.dark ? Colors.white : MyColors.red),
                        )),
                      ),
                    ),
                    DataCell(
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFFCC669).withOpacity(0.6),
                        ),
                        height: 5.h,
                        width: 20.w,
                        child: Center(
                            child: Text(
                          "En cours",
                          style: MyTextStyles.body.copyWith(color: p.dark ? Colors.white : const Color(0xFFD97808)),
                        )),
                      ),
                    ),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CommandDetailScreen(commande: commandes[index])),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
