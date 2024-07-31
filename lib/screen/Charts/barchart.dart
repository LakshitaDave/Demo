import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';

class barChart extends StatefulWidget {
  const barChart({super.key});

  @override
  State<barChart> createState() => _barChartState();
}

class _barChartState extends State<barChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child:  BarChart(
          BarChartData(
            borderData: FlBorderData(
              border: const Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 2),
                bottom: BorderSide(width: 2),
              ),
            ),
            barGroups: [
              BarChartGroupData(x: 1,barRods: [
                BarChartRodData(fromY:0, toY: 10, width: 15, color:const Color(0xFF42A5F5)),
              ],),
              BarChartGroupData(x: 2,barRods: [
                BarChartRodData(fromY:0, toY: 20, width: 15, color:const Color(0xFF42A5F5)),
              ],),
              BarChartGroupData(x: 3,barRods: [
                BarChartRodData(fromY:0, toY: 15, width: 15, color:const Color(0xFF42A5F5)),
              ],),
            ]
          ),
        ),
      ),
    );
  }
}
