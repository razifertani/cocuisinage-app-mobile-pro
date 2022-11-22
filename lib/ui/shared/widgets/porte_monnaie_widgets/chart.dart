import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class BarChartSample1 extends StatefulWidget {
  const BarChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 100.w < 600 ? 1.2 : 1.4,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        //  color: const Color(0xff81e5cd),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 4.h,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: BarChart(
                    mainBarData(),
                    swapAnimationDuration: animDuration,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    double width = 15,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barsSpace: 20,
      barRods: [
        BarChartRodData(
          borderRadius: BorderRadius.zero,
          toY: isTouched ? y + 1 : y,
          color: Color(0xFF4C4657),
          width: 20,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 30,
            color: MyColors.red,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(12, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 12.5, isTouched: i == touchedIndex);
          case 7:
            return makeGroupData(7, 20, isTouched: i == touchedIndex);
          case 8:
            return makeGroupData(8, 5, isTouched: i == touchedIndex);
          case 9:
            return makeGroupData(9, 14, isTouched: i == touchedIndex);
          case 10:
            return makeGroupData(10, 15, isTouched: i == touchedIndex);
          case 11:
            return makeGroupData(11, 18, isTouched: i == touchedIndex);
          case 12:
            return makeGroupData(12, 8, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.white,
            tooltipRoundedRadius: 10,
            maxContentWidth: 50,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                ' ',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: (rod.toY - 1).toString() + ' €',
                      style: MyTextStyles.body.copyWith(color: MyColors.red)),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 35,
            showTitles: true,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    Widget text;
    TextStyle? sty =
        MyTextStyles.body.copyWith(fontWeight: FontWeight.w600, fontSize: 11);
    switch (value.toInt()) {
      case 0:
        text = Text(
          "JAN",
          style: sty,
        );
        break;
      case 1:
        text = Text("FEV", style: sty);

        break;
      case 2:
        text = Text("MAR", style: sty);

        break;
      case 3:
        text = Text("AVR", style: sty);

        break;
      case 4:
        text = Text("MAI", style: sty);

        break;
      case 5:
        text = Text("JUIN", style: sty);

        break;
      case 6:
        text = Text("JUIL", style: sty);

        break;
      case 7:
        text = Text("AOU", style: sty);

        break;
      case 8:
        text = Text("SEP", style: sty);

        break;
      case 9:
        text = Text("OCT", style: sty);

        break;
      case 10:
        text = Text("NOV", style: sty);

        break;
      case 11:
        text = Text("DEC", style: sty);

        break;
      default:
        text = Text("");
        break;
    }
    return SideTitleWidget(
      space: 16,
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      await refreshState();
    }
  }
}
