import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({super.key});

  final String label;
  final double amount;
  final double percent;
  final Color color;

  ChartBar(
    this.label,
    this.amount,
    this.percent,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40),
        Text((percent * 100).toInt().toString() + '%'),
        Container(
          height: 100,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey, width: 1.0),
              //     color: Colors.grey,
              //     // borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
              FractionallySizedBox(
                widthFactor: 3,
                heightFactor: percent,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    // borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
