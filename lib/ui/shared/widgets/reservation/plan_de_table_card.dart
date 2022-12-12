import 'dart:math';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/table.dart' as Table;
import 'package:flutter/material.dart';

class PlanDeTableCard extends StatefulWidget {
  final DateTime date;

  final Table.Table table;
  const PlanDeTableCard({Key? key, required this.date, required this.table}) : super(key: key);

  @override
  State<PlanDeTableCard> createState() => _PlanDeTableCardState();
}

class _PlanDeTableCardState extends State<PlanDeTableCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
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
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.0015)
        ..rotateY(pi * _animation.value),
      child: _animation.value <= 0.5
          ? GestureDetector(
              onTap: () {
                if (_status == AnimationStatus.dismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              child: Card(
                color: Color(0xFF52C781),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    // Hamed
                    // Color At Starting
                    // "${widget.table.isFreeAtDateTime(DateTime(2022, 12, 12, 16, 00))}",
                    "${widget.table.name}",
                    style: MyTextStyles.headline.copyWith(color: Colors.white),
                  ),
                ),
              ),
            )
          : Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015)
                ..rotateY(pi * _animation.value),
              child: GestureDetector(
                onTap: () {
                  // if (_status == AnimationStatus.dismissed) {
                  //   _controller.forward();
                  // } else {
                  //   _controller.reverse();
                  // }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CaisseScreen()),
                  // );
                },
                child: Card(
                  color: Color(0xFFED4A4A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.table.name}",
                              style: MyTextStyles.headline.copyWith(color: Colors.white),
                            ),
                            const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        widget.table.getReservationsAtDateTime(widget.date).length > 0 ? Text("${widget.table.getReservationsAtDateTime(widget.date).first.clientName}", style: MyTextStyles.subhead.copyWith(color: Colors.white)) : Text("Empty", style: MyTextStyles.subhead.copyWith(color: Colors.white)),
                        widget.table.getReservationsAtDateTime(widget.date).length > 0 ? Text("${widget.table.getReservationsAtDateTime(widget.date).first.nbPeople} Pers", style: MyTextStyles.body.copyWith(color: Colors.white)) : Text("", style: MyTextStyles.subhead.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
