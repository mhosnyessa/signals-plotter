import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: Text('Hi Mom'),
        child: LineChart(
          LineChartData(
            lineBarsData: <LineChartBarData>[
              LineChartBarData(
                  show: true,
                  isCurved: true,
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
            minX: 30,
            maxX: 360,
            // Y
            minY: -100,
            maxY: 100,
          ),
        ),
      ),
    );
  }
}
