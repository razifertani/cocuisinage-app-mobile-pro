import 'dart:math';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/reservation.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/table.dart'
    as Table;
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/reservations_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlanDeTableCard extends StatefulWidget {
  final Table.Table table;
  final DateTime date;
  final Reservation? reservation;

  const PlanDeTableCard(
      {Key? key, required this.date, required this.table, this.reservation})
      : super(key: key);

  @override
  State<PlanDeTableCard> createState() => _PlanDeTableCardState();
}

class _PlanDeTableCardState extends State<PlanDeTableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    // print('Test: ' + '*****************');
    // print('Test: ' + '${widget.date}');
    // print('Test: ' + '${widget.table.isFreeAtDateTime(widget.date)}');
    // print('Test: ' + '${_animation.value <= 0.5}');

    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0015)
          ..rotateY(pi * _animation.value),
        child:
            // _animation.value <= 0.5 && widget.table.isFreeAtDateTime(widget.date)
            // ?
            CustomButton(
          txt: "${widget.table.nbPersons}",
          color: widget.reservation != null
              ? _animation.value > 0.5
                  ? Color(0xFFED4A4A)
                  : (!widget.table.isFreeAtDateTime(widget.date)
                      ? Color(0xFFED4A4A)
                      : widget.table.nbPersons < widget.reservation!.nbPeople
                          ? Colors.orange
                          : Color(0xFF52C781))
              : Color(0xFF52C781),
          fun: (startLoading, stopLoading, btnState) {
            if (btnState == ButtonState.Idle) {
              if (!widget.table.isFreeAtDateTime(widget.date)) {
                Color(0xFFED4A4A);

                Utils.showCustomTopSnackBar(context,
                    success: false, message: 'Table déjà réservée !');
              } else if (widget.table.nbPersons <
                  widget.reservation!.nbPeople) {
                Colors.orange;

                Utils.showCustomTopSnackBar(context,
                    success: false,
                    message:
                        'Nombre de couverts est inférieur au nombre de personnes réservées !');
              } else {
                Color(0xFF52C781);

                startLoading();
                assignTableToReservationWS(
                  reservationID: widget.reservation!.id,
                  tableID: widget.table.id,
                  day: widget.date,
                  hour: DateFormat.Hm().format(widget.date),
                ).then((exceptionOrMessage) {
                  stopLoading();
                  exceptionOrMessage.fold(
                    (exception) {
                      setState(() {});
                      Utils.showCustomTopSnackBar(context,
                          success: false, message: exception.toString());
                    },
                    (message) {
                      stopLoading();
                      Utils.showCustomTopSnackBar(context,
                          success: true, message: message);
                      _controller.forward();
                      _controller.addStatusListener((status) {
                        if (status == AnimationStatus.completed) {
                          setState(() {});
                        }
                      });
                    },
                  );
                });
              }
            }
          },
        )

//           GestureDetector(
//               onTap: () {
//                 // Book table

// // assignTableToReservationWS()

//                 _controller.forward();
//               },
//               child: Card(
//                 color: Color(0xFF52C781),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 elevation: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "${widget.table.name}",
//                     style: MyTextStyles.headline.copyWith(color: Colors.white),
//                   ),
//                 ),
//               ),
//             )
        // : Transform(
        //     alignment: FractionalOffset.center,
        //     transform: Matrix4.identity()
        //       ..setEntry(3, 2, 0.0015)
        //       ..rotateY(pi * _animation.value),
        //     child: GestureDetector(
        //       onTap: () {
        //         // if (_status == AnimationStatus.dismissed) {
        //         //   _controller.forward();
        //         // } else {
        //         //   _controller.reverse();
        //         // }
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(builder: (context) => CaisseScreen()),
        //         // );
        //       },
        //       child: Card(
        //         color: Color(0xFFED4A4A),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(20.0),
        //         ),
        //         elevation: 3,
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     "${widget.table.name}",
        //                     style: MyTextStyles.headline.copyWith(color: Colors.white),
        //                   ),
        //                   GestureDetector(
        //                     onTap: () {
        //                       deleteReservationWS(id: widget.reservation!.id).then((exceptionOrMessage) {
        //                         exceptionOrMessage.fold(
        //                           (exception) {
        //                             Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
        //                           },
        //                           (message) {
        //                             setState(() {});
        //                             Utils.showCustomTopSnackBar(context, success: true, message: message);
        //                           },
        //                         );
        //                       });
        //                     },
        //                     child: Icon(
        //                       Icons.close,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               Text("${widget.table.getReservationsAtDateTime(widget.date).first.clientName}", style: MyTextStyles.subhead.copyWith(color: Colors.white)),
        //               Text("${widget.table.getReservationsAtDateTime(widget.date).first.nbPeople} Pers", style: MyTextStyles.body.copyWith(color: Colors.white)),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),),
        );
  }
}
