import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
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
  DateTime seledtedDate = DateTime.now();

  DateTime selectedDate = DateTime.now();
  changeDate(DateTime date) {
    selectedDate = date;
    setState(() {});
    print(selectedDate);
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

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
            onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              HorizontalCalendar(
                  initialDateTime: selectedDate, ondateChanged: changeDate),
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: Globals.profile
                      .getReservationsForDate(day: seledtedDate)
                      .length,
                  itemBuilder: (context, index) {
                    print(Globals.profile
                        .getReservationsForDate(day: seledtedDate));

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: ReservationCard(
                        reservation: Globals.profile
                            .getReservationsForDate(day: seledtedDate)[index],
                      ),
                    );
                  }),
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
