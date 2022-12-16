import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SuccessShowmodel extends StatelessWidget {
  String description;
  SuccessShowmodel({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Builder(builder: (context) {
          return SizedBox(
              height: 35.h,
              width: 80.w,
              child: Column(children: [
                SizedBox(
                  height: 5.h,
                ),
                Image.asset("assets/images/succes.png"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp.clamp(14, 18),
                  ),
                ),
              ]));
        }));
  }
}
