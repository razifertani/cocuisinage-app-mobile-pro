import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/bottom_app_bar.dart';

import '../../../shared/floating_action_button_home.dart';
import '../../../shared/widgets/planning_widgets/horizontal_calendar.dart';
import '../../../shared/widgets/reservation/raduil_gauge_reservation.dart';
import '../../../shared/widgets/reservation/reservation_card.dart';
import 'ajouter_reservation.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  var date = DateTime.now();
  final List<String> times = ["19h:00", "16h:30", "18h:45", "20h:00"];
  final List<String> names = [
    "Mr. Bonneau",
    "Mr. Daniel",
    "Mr. Joe",
    "Mdm Sarah"
  ];
  final List<String> pers = ["2 Pers", "2 Pers", "4 Pers", "5 Pers"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Réservations",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AjouterReservation()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  color:
                      Theme.of(context).scaffoldBackgroundColor == Colors.black
                          ? Color(0xFF202020)
                          : Color(0xFFE1E1E1),
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add,
                      color: Color(0xFFAEAEAE),
                    ),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...List.generate(
                  4,
                  (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: ReservationCard(
                          name: names[index],
                          pers: pers[index],
                          time: times[index],
                        ),
                      )),
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
