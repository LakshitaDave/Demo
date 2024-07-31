import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class pieChart extends StatefulWidget {
  const pieChart({super.key});

  @override
  State<pieChart> createState() => _pieChartState();
}

class _pieChartState extends State<pieChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: PieChart(
          PieChartData(
              centerSpaceRadius: 5,
            borderData: FlBorderData(show: false),
            sectionsSpace: 2,
            sections: [
              PieChartSectionData(
                value: 35, color: const Color(0xFFFF9000),radius: 100,
              ),
              PieChartSectionData(
                value: 45, color: Color(0xFFF7000),radius: 100,
              ),PieChartSectionData(
                value: 20, color: const Color(0xAFFF2000),radius: 100,
              ),

            ]
          )
        ),
      ),
    );
  }
}
