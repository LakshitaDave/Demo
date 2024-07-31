
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class lineChart extends StatefulWidget {
  const lineChart({super.key});

  @override
  State<lineChart> createState() => _lineChartState();
}

class _lineChartState extends State<lineChart> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,

          child: LineChart(
            LineChartData(
              backgroundColor: Colors.blueGrey[50],

              titlesData:  FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  axisNameWidget: const Text('Months'),
                  sideTitles: SideTitles(
                    showTitles: true,
                    //reservedSize: 30,
                    getTitlesWidget: (value,meta){
                      String txt = '';
                      switch (value.toInt()){
                        case 0:
                          txt='Jan';
                          break;
                        case 3:
                          txt='April';
                          break;
                        case 6:
                          txt='July';
                          break;
                        case 9:
                          txt='Oct';
                          break;
                        case 11:
                          txt='Dec';
                          break;
                      }
                      return Text(txt);
                    }
                  ),
                ),
                leftTitles:  AxisTitles(
                  axisNameWidget: Text('Sales'),
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value,meta) {
                      String text='';
                      switch (value) {
                        case 1:
                          text = '10K';
                          break;
                        case 3:
                          text = '30k';
                          break;
                        case 5:
                          text = '50k';
                          break;
                      }
                      return Text(text);
                    }
                  )
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 6,
              gridData:  FlGridData(
                show: true,
                getDrawingHorizontalLine:(value) {
                  return const FlLine(
                    color: Colors.blueGrey,
                    strokeWidth: 2,
                  );
                },
                getDrawingVerticalLine:(value) {
                  return const FlLine(
                    color: Colors.blueGrey,
                    strokeWidth: 2,
                  );
                }
                ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black,width: 2),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                     FlSpot(0, 3),
                     FlSpot(2.6, 2),
                     FlSpot(4.9, 5),
                     FlSpot(6.8, 2.5),
                     FlSpot(8, 4),
                     FlSpot(9.5, 3),
                     FlSpot(11, 4),
                  ],
                  isCurved: true,
                  color: Colors.red,
                  barWidth: 5,

                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.red[50]?.withOpacity(0.8),
                  ),

                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}


