import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../models/activity.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  // const Chart({super.key});
  final List<Activity> recentActivities;

  Chart(this.recentActivities);

  // List<Map<String, Object>> get groupedActivities {
  //   return List.generate(
  //     3,
  //     (index) {
  //       final weekDay = DateTime.now().subtract(
  //         Duration(days: index),
  //       );
  //       double totalSum;

  //       // for (var i = 0; i < recentActivities.length; i++) {
  //       //   if (recentActivities[i])
  //       // }
  //       return {
  //         'day': 'T',
  //         'amount': 9.99,
  //       };
  //     },
  //   );
  // }

  final List<ChartBar> bars = [
    ChartBar(
      'Food',
      0.69,
      0.49,
      Colors.blue,
    ),
    ChartBar(
      'Transport',
      0.69,
      0.38,
      Colors.cyan,
    ),
    ChartBar(
      'Energy',
      0.69,
      0.13,
      Colors.pink,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        // padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: bars.map((data) {
            return ChartBar(
              data.label,
              data.amount,
              data.percent,
              data.color,
            );
          }).toList(),
        ),
      ),
    );
  }
}
