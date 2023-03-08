import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 35.h,
            width: 85.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset("assets/icons/success_tick.png"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Super !",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Montant payé : 49.50€",
                  style: MyTextStyles.subhead,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Payemment du 50.00€ avec une réduction du 0.50€ avec succées",
                  style: MyTextStyles.body.copyWith(color: Colors.grey),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
