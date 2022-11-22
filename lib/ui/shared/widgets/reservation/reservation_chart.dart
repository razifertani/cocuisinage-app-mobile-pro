import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';

class ReservationChart extends StatelessWidget {
  const ReservationChart({Key? key}) : super(key: key);

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '9h:00';
        break;
      case 3:
        text = '12h:00';
        break;
      case 5:
        text = '14h:00';
        break;
      case 7:
        text = '16h:00';
        break;
      case 9:
        text = '18h:00';
        break;

      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        ' ${value - 1}',
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 6),
                  FlSpot(1, 6),
                  FlSpot(2, 6),
                  FlSpot(3, 6),
                  FlSpot(4, 6),
                  FlSpot(5, 5),
                  FlSpot(6, 4),
                  FlSpot(7, 8),
                  FlSpot(8, 3),
                  FlSpot(9, 2),
                  FlSpot(10, 3),
                ],
                isCurved: true,
                barWidth: 2,
                color: MyColors.red,
                dotData: FlDotData(
                  show: false,
                ),
              ),
            ],
            // minY: 0,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitleWidgets,
                  interval: 1,
                  reservedSize: 36,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              // drawVerticalLine: true,
              horizontalInterval: 1,
              verticalInterval: 1,
              checkToShowHorizontalLine: (double value) {
                return value == 1 || value == 3 || value == 5 || value == 7;
              },
              checkToShowVerticalLine: (value) =>
                  value == 1 ||
                  value == 3 ||
                  value == 5 ||
                  value == 7 ||
                  value == 9,
            ),
          ),
        ),
      ),
    );
  }
}
