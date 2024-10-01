import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vizscope/colors.dart';

class FCSRefurbishment extends StatefulWidget {
  const FCSRefurbishment({super.key});

  @override
  State<FCSRefurbishment> createState() => _FCSRefurbishmentState();
}

class _FCSRefurbishmentState extends State<FCSRefurbishment> {
  final data = [
    [172.00, 142.76, 173.68],
    [16.00, 20.76, 15.93],
    [2.00, 1.93, 1.93],
    [12.00, 12.70, 12.70],
    [100.00, 135.61, 135.61],
    [45.00, 80.46, 80.46],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.textColor,
        backgroundColor: Colors.transparent,
        title: const Text("FCS Refurbishment"),
      ),
      backgroundColor: AppColor.bgColor,
      body: Column(
        children: [
          // const SizedBox(height: 20),
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          //   decoration: BoxDecoration(
          //     color: AppColor.textColor,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: const Text(
          //     'FCS Summary',
          //     style: TextStyle(
          //       color: AppColor.textColor,
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLabelBox('Approved', Colors.blue),
              _buildLabelBox('Commitment', Colors.red),
              _buildLabelBox('Total Commitment', Colors.green),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 1000,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: MaxValueFinder().findMaxValue(data),
                          barTouchData: BarTouchData(enabled: false),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: getBottomTitles,
                                reservedSize: 240,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 20,
                                getTitlesWidget:
                                    (double value, TitleMeta meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: const TextStyle(
                                      color: AppColor.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  );
                                },
                                reservedSize: 40,
                              ),
                            ),
                            topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 20,
                                getTitlesWidget:
                                    (double value, TitleMeta meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: const TextStyle(
                                      color: AppColor.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  );
                                },
                                reservedSize: 40,
                              ),
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: true,
                            horizontalInterval: 20,
                            verticalInterval: 1,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                // color: Colors.grey.withOpacity(0.3),
                                color: Colors.grey.withOpacity(0.5),
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: Colors.grey.withOpacity(0.3),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            makeGroupData(0, 172, 142.76, 173.68),
                            makeGroupData(1, 16, 20.76, 15.93),
                            makeGroupData(2, 2, 1.93, 1.93),
                            makeGroupData(3, 12, 12.7, 12.7),
                            makeGroupData(4, 100, 135.61, 135.61),
                            makeGroupData(5, 45, 80.46, 80.46),
                          ],
                          groupsSpace: 20,
                        ),
                      ),
                    ),
                    CustomPaint(
                      size: const Size(1000, 400),
                      painter: ValueLabelPainter(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColor.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Civil & Furniture';
        break;
      case 1:
        text = 'Landscape';
        break;
      case 2:
        text = 'Plumbing';
        break;
      case 3:
        text = 'Electrical';
        break;
      case 4:
        text = 'HVAC';
        break;
      case 5:
        text = 'Bought Outs';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(text, style: style),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.blue,
          width: 16,
          borderRadius: BorderRadius.zero,
        ),
        BarChartRodData(
          toY: y2,
          color: Colors.red,
          width: 16,
          borderRadius: BorderRadius.zero,
        ),
        BarChartRodData(
          toY: y3,
          color: Colors.green,
          width: 16,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }

  Widget _buildLabelBox(String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ValueLabelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    final data = [
      [172.00, 142.76, 173.68],
      [16.00, 20.76, 15.93],
      [2.00, 1.93, 1.93],
      [12.00, 12.70, 12.70],
      [100.00, 135.61, 135.61],
      [45.00, 80.46, 80.46],
    ];

    final double chartWidth = size.width - 115;
    final double groupWidth = chartWidth / 6;
    const double barWidth = 18;

    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].length; j++) {
        textPainter.text = TextSpan(
          text: data[i][j].toStringAsFixed(2),
          style: const TextStyle(color: AppColor.textColor, fontSize: 12),
        );
        textPainter.layout();

        final double groupStartX = 115 + i * groupWidth;
        final double barCenterX = groupStartX + j * (barWidth) + barWidth / 2;

        double maxHeight = MaxValueFinder().findMaxValue(data);
        final double barHeight = data[i][j] / maxHeight * (size.height - 90);
        final double yPosition = size.height - 8 - barHeight - 85;

        canvas.save();
        canvas.translate(barCenterX, yPosition);
        canvas.rotate(-pi / 2);

        textPainter.paint(
            canvas, Offset(-textPainter.height, -textPainter.width / 2));

        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MaxValueFinder {
  double findMaxValue(List<List<double>> data) {
    double maxValue =
        data.fold<double>(double.negativeInfinity, (maxValue, list) {
      double maxInList = list.reduce(
          (double value, double element) => value > element ? value : element);
      return maxValue > maxInList ? maxValue : maxInList;
    });

    int roundedValue = (maxValue / 20).ceil() * 20;

    if (roundedValue - maxValue < 20) {
      roundedValue += 20;
    }

    return roundedValue.toDouble();
  }
}
