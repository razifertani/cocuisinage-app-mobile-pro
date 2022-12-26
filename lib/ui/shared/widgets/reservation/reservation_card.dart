import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/reservation.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/reservations_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../screens/reservation/plan_de_table/plan_de_table.dart';

class ReservationCard extends StatefulWidget {
  final Reservation reservation;

  const ReservationCard({Key? key, required this.reservation}) : super(key: key);

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.reservation.clientName}',
                  style: MyTextStyles.cardTextStyle,
                ),
                Text(
                  '${widget.reservation.nbPeople} Pers',
                  style: MyTextStyles.cardTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Theme.of(context).scaffoldBackgroundColor == Colors.black ? Colors.white : Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    deleteReservationWS(id: widget.reservation.id).then((exceptionOrMessage) {
                      exceptionOrMessage.fold(
                        (exception) {
                          Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                        },
                        (message) {
                          setState(() {});
                          Utils.showCustomTopSnackBar(context, success: true, message: message);
                        },
                      );
                    });
                  },
                  icon: const Icon(Icons.close, color: Colors.red),
                ),
                Text(
                  '${widget.reservation.hour}\nTable ${widget.reservation.table?.name ?? '?'}',
                  style: MyTextStyles.cardTextStyle,
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlanDeTableScreen(
                          reservation: widget.reservation,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
