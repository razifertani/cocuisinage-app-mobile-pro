import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class RaduilGaugeReservation extends StatelessWidget {
  final DateTime date;
  RaduilGaugeReservation({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 40.w,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
          canScaleToFit: true,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: double.parse(Globals.profile.getPercentageForDate(date: date)),
              color: MyColors.red,
            ),
            GaugeRange(
              startValue: double.parse(Globals.profile.getPercentageForDate(date: date)),
              endValue: 180,
              color: MyColors.red.withOpacity(0.3),
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${Globals.profile.getPercentageForDate(date: date)}%', style: MyTextStyles.headline.copyWith(color: MyColors.red)),
                    AutoSizeText(
                      "de réservations",
                      style: MyTextStyles.subhead,
                      maxLines: 1,
                    ),
                  ],
                ),
                // angle: 270,
                positionFactor: 0.1)
          ],
          startAngle: 180,
          endAngle: 0,
          showLabels: false,
          showTicks: false,
        )
      ]),
    );
  }
}
