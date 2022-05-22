import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:signals_plotter/input_screen.dart';

import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ResultScreen(data: data),
      home: InputScreen(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
