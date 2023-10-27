import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/widgets.g.dart';

class ExamPieChartInfo extends StatefulWidget {
  const ExamPieChartInfo({super.key});

  @override
  State<ExamPieChartInfo> createState() => _ExamPieChartInfoState();
}

class _ExamPieChartInfoState extends State<ExamPieChartInfo> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15000000596046448), offset: Offset(0, 10), blurRadius: 60)],
        color: const Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(
          color: const Color.fromRGBO(243, 243, 244, 1),
          width: 1,
        ),
      ),
      child: PieChartWidget(
        touchCallback: (FlTouchEvent event, pieTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
          });
        },
        touchedIndex: touchedIndex,
        sections: List.generate(2, (i) {
          final isTouched = i == touchedIndex;
          final fontSize = isTouched ? 25.0 : 16.0;
          final radius = isTouched ? 35.0 : 30.0;
          const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
          switch (i) {
            case 0:
              return PieChartSectionData(
                color: const Color(0xFFF59304),
                value: 40,
                title: '40%',
                borderSide: const BorderSide(width: 0),
                radius: radius,
                titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: shadows,
                ),
              );
            case 1:
              return PieChartSectionData(
                color: const Color(0xFF4E74F9),
                value: 60,
                title: '60%',
                radius: radius,
                borderSide: const BorderSide(width: 0),
                titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: shadows,
                ),
              );
            default:
              if (kDebugMode) {
                print("showingSections $i");
              }
              return PieChartSectionData();
          }
        }),
        crossAxisAlignment: CrossAxisAlignment.start,
        child: const Padding(
          padding: EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text(
                "Mock Exam Mcq",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff27093E),
                ),
              ),
              SizedBox(height: 30),
              Indicator(
                color: Color(0xFF4E74F9),
                text: '60',
                label: Text(
                  "Correct",
                  style: TextStyle(color: Color(0xff1D1E23), fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Indicator(
                color: Color(0xFFF59304),
                text: '40',
                label: Text(
                  "Incorrect",
                  style: TextStyle(color: Color(0xff1D1E23), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
