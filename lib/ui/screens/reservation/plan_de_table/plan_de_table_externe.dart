import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/reservation.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/porte_monnaie.dart/histo_de_depense.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/plan_de_table/historique_de_table/histo_de_table.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/plan_de_table/modifier_nmr_de_table/modifier_nmr_de_table.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/reservation/ajouter_nmr_de_table_popup.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../../utils/utils.dart';
import '../../../shared/widgets/planning_widgets/horizontal_calendar.dart';
import '../../../shared/widgets/pop_qr/pop_up_qr_code.dart';
import '../../../shared/widgets/reservation/plan_de_table_card.dart';
import '../../../shared/widgets/roles/delete_confirmation_popup.dart';

class PlanDeTableScreenExterne extends StatefulWidget {
  PlanDeTableScreenExterne({Key? key}) : super(key: key);

  @override
  State<PlanDeTableScreenExterne> createState() => _PlanDeTableScreenExterneState();
}

class _PlanDeTableScreenExterneState extends State<PlanDeTableScreenExterne> {
  var date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, 0);

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    // if (widget.reservation != null) {
    //   date = DateTime(
    //       widget.reservation!.day.year,
    //       widget.reservation!.day.month,
    //       widget.reservation!.day.day,
    //       int.parse(widget.reservation!.hour.split(':')[0]),
    //       int.parse(widget.reservation!.hour.split(':')[1]));
    // } else {
    //   date = DateTime.now();
    // }
  }

  TextEditingController nmr = TextEditingController();
  // Tap location will be used use to position the context menu
  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  changeDate(DateTime dateTime) {
    date = dateTime;
    setState(() {});
  }

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
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              HorizontalCalendar(initialDateTime: date, ondateChanged: changeDate),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            date = date.subtract(const Duration(hours: 1));
                            setState(() {});
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: MyColors.red,
                          )),
                      Text(
                        DateFormat.Hm().format(date.subtract(const Duration(hours: 1))),
                        style: MyTextStyles.body.copyWith(color: MyColors.red),
                      ),
                    ],
                  ),
                  Text(
                    DateFormat.Hm().format(date),
                    style: MyTextStyles.headline.copyWith(color: MyColors.red),
                  ),
                  Row(
                    children: [
                      Text(
                        DateFormat.Hm().format(date.add(const Duration(hours: 1))),
                        style: MyTextStyles.body.copyWith(color: MyColors.red),
                      ),
                      GestureDetector(
                        onTap: () {
                          date = date.add(const Duration(hours: 1));
                          setState(() {});
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: MyColors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 1.5.h,
                crossAxisSpacing: 1.5.h,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     showDialog(
                  //             context: context,
                  //             builder: (_) => new AjouterNmrDeTablePopUp())
                  //         .then((value) => setState(() {}));
                  //   },
                  //   child: Card(
                  //     color: const Color(0xFFE1E1E1),
                  //     elevation: 3,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: const Center(
                  //       child: Icon(
                  //         Icons.add,
                  //         color: Color(0xFFAEAEAE),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ...List.generate(
                    Globals.profile.getEstablishment().tables.length,
                    (index) => Stack(
                      children: [
                        PlanDeTableCard(
                          date: date,
                          // reservation: Globals.profile
                          //     .getEstablishment()
                          //     .tables[index]
                          //     .reservations
                          //     .where((element) =>
                          //         element.day == date.day &&
                          //         element.hour == date.hour)
                          //     .first,
                          table: Globals.profile.getEstablishment().tables[index],
                        ),
                        Positioned(
                          top: 1,
                          right: 30,
                          child: SizedBox(
                            height: 40,
                            width: 30,
                            child: PopupMenuButton(
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                              onSelected: (value) async {
                                switch (value) {
                                  case 'Historique':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HistoriqueDeTable(table: Globals.profile.getEstablishment().tables[index]),
                                      ),
                                    );
                                    break;
                                  case 'Scanner code Qr':
                                    Utils.pushScreen(context, PopUpQrCode(tableID: Globals.profile.getEstablishment().tables[index].id), 0.55);
                                    break;
                                  case 'Supprimer':
                                    bool? delete = false;
                                    delete = await showDialog(
                                      context: context,
                                      builder: (context) => ConfirmationShowmodel(
                                        title: "vous étes sur de supprimer cet table ?",
                                      ),
                                    );
                                    if (delete ?? false) {
                                      print("object");
                                    }
                                    break;
                                  case 'Modifier':
                                    showDialog(
                                      context: context,
                                      builder: (context) => ModifierNmrDeTable(),
                                    );
                                    break;
                                }
                              },
                              itemBuilder: (BuildContext bc) {
                                return [
                                  PopupMenuItem(
                                    child: const Text("Historique"),
                                    value: 'Historique',
                                  ),
                                  PopupMenuItem(
                                    child: const Text("Scanner code Qr"),
                                    value: 'Scanner code Qr',
                                  ),
                                  PopupMenuItem(
                                    child: const Text("Modifier"),
                                    value: 'Modifier',
                                  ),
                                  PopupMenuItem(
                                    child: const Text("Supprimer"),
                                    value: 'Supprimer',
                                  ),
                                ];
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
