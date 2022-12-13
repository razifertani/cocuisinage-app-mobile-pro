import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/reservation/ajouter_nmr_de_table_popup.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/planning_widgets/horizontal_calendar.dart';
import '../../../shared/widgets/reservation/plan_de_table_card.dart';

class PlanDeTableScreen extends StatefulWidget {
  final int? reservationID;
  PlanDeTableScreen({Key? key, this.reservationID}) : super(key: key);

  @override
  State<PlanDeTableScreen> createState() => _PlanDeTableScreenState();
}

class _PlanDeTableScreenState extends State<PlanDeTableScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  var date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, 0);
  TextEditingController nmr = TextEditingController();
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
            children: [
              const SizedBox(
                height: 20,
              ),
              HorizontalCalendar(),
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
                  InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (_) => new AjouterNmrDeTablePopUp()).then((value) => setState(() {}));
                    },
                    child: Card(
                      color: const Color(0xFFE1E1E1),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Color(0xFFAEAEAE),
                        ),
                      ),
                    ),
                  ),
                  ...List.generate(
                    Globals.profile.getEstablishment().tables.length,
                    (index) => PlanDeTableCard(
                      date: date,
                      reservationID: widget.reservationID,
                      table: Globals.profile.getEstablishment().tables[index],
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
