import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:signals_plotter/input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = [
      [30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330, 360],
      [62, 35, -38, -64, -63, -52, -28, 24, 80, 96, 90, 70]
    ];
    return MaterialApp(
      // home: ResultScreen(data: data),
      home: InputScreen(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
