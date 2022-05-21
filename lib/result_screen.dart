import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signal Graph')),
      body: Center(
        // child: Text('Hi Mom'),
        child: LineChart(
          LineChartData(
            // from my fav youtuber
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            //end of
            lineBarsData: <LineChartBarData>[
              LineChartBarData(
                  show: true,
                  isCurved: true,
                  colors: [Colors.blue, Colors.purple],
                  barWidth: 5,
                  // dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    colors: [Colors.blue, Colors.green]
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                  ),
                  spots: () {
                    List<FlSpot> flSpots = [];
                    for (var i = 0; i < data[0].length; i++) {
                      flSpots.add(FlSpot(
                        data[0][i].toDouble(),
                        data[1][i].toDouble(),
                      ));
                    }
                    return flSpots;
                  }()
                  // spots: List<FlSpot>.from(data[0].map((e) {
                  //   return FlSpot(e.toDouble(), e.toDouble());
                  // }).toList()),
                  // isCurved: true
                  ),
            ],
            minX: getMin(data[0]) - 10,

            maxX: getMax(data[0]) + 10,
            // Y
            minY: getMin(data[1]) - 10,
            maxY: getMax(data[1]) + 10,
          ),
        ),
      ),
    );
  }

  double getMax(List e) {
    e.sort();
    return e.last;
  }

  double getMin(List e) {
    e.sort();
    return e.first;
  }
}
