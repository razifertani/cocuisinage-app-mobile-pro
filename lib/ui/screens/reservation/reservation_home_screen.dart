import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/plan_de_table/plan_de_table.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/reservation_screens/reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../shared/bottom_app_bar.dart';
import '../../shared/custom_card.dart';
import '../../shared/floating_action_button_home.dart';
import '../../shared/widgets/planning_widgets/horizontal_calendar.dart';
import '../../shared/widgets/reservation/raduil_gauge_reservation.dart';
import '../../shared/widgets/reservation/reservation_chart.dart';
import '../drawer/drawer.dart';
import '../preparation_de_commande/prep_commande.dart';

class ReservationHomeScreen extends StatefulWidget {
  bool? isChef;
  ReservationHomeScreen({Key? key, this.isChef}) : super(key: key);

  @override
  State<ReservationHomeScreen> createState() => _ReservationHomeScreenState();
}

class _ReservationHomeScreenState extends State<ReservationHomeScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Réservations",
          style: MyTextStyles.appBarTextStyle,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.question_mark))
        ],
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const HorizontalCalendar(),
              const RaduilGaugeReservation(),
              const ReservationChart(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 28.h,
                child: GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    childAspectRatio: 1,
                    mainAxisSpacing: 1.5.h,
                    crossAxisSpacing: 1.5.h,
                    children: [
                      CustomCard(
                          imgPath: "assets/primary_icons/reservation.png",
                          txt: "Reservations",
                          quantite: 250,
                          fun: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ReservationScreen()),
                            );
                          }),
                      CustomCard(
                          imgPath: "assets/primary_icons/plan_de_table.png",
                          txt: "Plan de table",
                          quantite: 250,
                          fun: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PlanDeTableScreen()),
                            );
                          }),
                      CustomCard(
                          imgPath: "assets/primary_icons/service.png",
                          txt: "Mon service",
                          quantite: 250,
                          fun: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PreparationDeCommandeScreen()),
                            );
                          }),
                    ]),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}