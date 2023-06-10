import 'package:covid_tracker_app/ViewModel/Utilities/constant_files/pie_chart_color.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatelessWidget {
  final String total, totalval, recovered, recoveredval, death, deathval;

  const PieChartWidget({
    super.key,
    required this.total,
    required this.totalval,
    required this.recovered,
    required this.recoveredval,
    required this.death,
    required this.deathval,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: {
        total: double.parse(totalval),
        recovered: double.parse(recoveredval),
        death: double.parse(deathval),
      },
      animationDuration: const Duration(milliseconds: 1200),
      chartLegendSpacing: 60,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: ConstantFile().colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 20,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.left,
        showLegends: true, // for identification of colors ... Text Name.
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: true,
        decimalPlaces: 2,
      ),
    );
  }
}
