import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/widgets.g.dart';

class ExamPieChartInfo extends StatefulWidget {
  const ExamPieChartInfo({super.key, required this.examSummery});

  final Map<String, double> examSummery;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        examSummery: widget.examSummery,
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Text(
                "Mock Exam Mcq",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff27093E),
                ),
              ),
              const SizedBox(height: 30),
              Indicator(
                color: const Color(0xFF4E74F9),
                text: "${widget.examSummery['correctAnswers']?.toInt()}",
                label: const Text(
                  "Correct",
                  style: TextStyle(color: Color(0xff1D1E23), fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Indicator(
                color: const Color(0xFFF59304),
                text: "${widget.examSummery['incorrectAnswers']?.toInt()}",
                label: const Text(
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
