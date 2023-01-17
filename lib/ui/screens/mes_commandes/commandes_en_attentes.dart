import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/commande.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_text_styles.dart';
import '../../../controllers/theme_controller.dart';
import '../../../utils/globals.dart';
import '../../shared/widgets/commandes_widgets/expansiontile_widget.dart';
import 'commandes_details/commandes_details_screen.dart';

class CommandesEnAttentes extends StatefulWidget {
  DateTime selectedDate;
  CommandesEnAttentes({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<CommandesEnAttentes> createState() => _CommandesEnAttentesState();
}

class _CommandesEnAttentesState extends State<CommandesEnAttentes> {
  List<Commande> commandes = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      commandes = Globals.profile.getEstablishment().commandes.where((element) {
        return DateTime.parse(element.createdAt!).isSameDayAs(widget.selectedDate) && (element.status == 0);
      }).toList();
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
                (index) => DataRow(cells: [
                  DataCell(
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFD43347).withOpacity(0.16),
                      ),
                      height: 5.h,
                      width: 18.w,
                      child: Center(
                          child: Text(
                        "${commandes[index].montant} €",
                        style: MyTextStyles.body.copyWith(color: p.dark ? Colors.white : MyColors.red),
                      )),
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        GestureDetector(child: Image.asset("assets/icons/close-square.png")),
                        GestureDetector(child: Image.asset("assets/icons/tick-square.png")),
                      ],
                    ),
                  ),
                  DataCell(IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CommandDetailScreen(commande: commandes[index])),
                      );
                    },
                  )),
                ]),
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
