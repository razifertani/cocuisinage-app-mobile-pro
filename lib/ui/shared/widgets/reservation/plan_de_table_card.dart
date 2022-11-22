import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class PlanDeTableCard extends StatefulWidget {
  final int nmr;
  const PlanDeTableCard({Key? key, required this.nmr}) : super(key: key);

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
                    "00${widget.nmr}",
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
                              "00${widget.nmr}",
                              style: MyTextStyles.headline
                                  .copyWith(color: Colors.white),
                            ),
                            const Icon(
                              Icons.close,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Mr Bonneau",
                            style: MyTextStyles.subhead
                                .copyWith(color: Colors.white)),
                        Row(
                          children: [
                            Text("4 Pers",
                                style: MyTextStyles.body
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
