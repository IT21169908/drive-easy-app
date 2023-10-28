import 'package:drive_easy_app/screens/students/exams/exam_dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.g.dart';

class ExamResultScreen extends StatefulWidget {
  final List answeredQuestions;

  const ExamResultScreen({super.key, required this.answeredQuestions});

  @override
  State<ExamResultScreen> createState() => _ExamResultScreenState();
}

class _ExamResultScreenState extends State<ExamResultScreen> {
  int touchedIndex = -1;

  late final Map<String, double> examSummery;

  @override
  initState() {
    examSummery = calculatePercentages();
    super.initState();
  }

  Map<String, double> calculatePercentages() {
    int totalQuestions = widget.answeredQuestions.length;
    int correctAnswers = widget.answeredQuestions.where((question) {
      return question.containsKey('given_answer') && question['given_answer'] == question['correct_option_id'];
    }).length;
    int incorrectAnswers = totalQuestions - correctAnswers;

    double correctPercentage = (correctAnswers / totalQuestions) * 100;
    double incorrectPercentage = (incorrectAnswers / totalQuestions) * 100;

    if (kDebugMode) {
      print('Correct Answers: $correctAnswers out of $totalQuestions');
      print('Correct Percentage: $correctPercentage%');

      print('Incorrect Answers: $incorrectAnswers out of $totalQuestions');
      print('Incorrect Percentage: $incorrectPercentage%');
    }

    return {
      "totalQuestions": double.parse(totalQuestions.toString()),
      "correctAnswers": double.parse(correctAnswers.toString()),
      "incorrectAnswers": double.parse(incorrectAnswers.toString()),
      "correctPercentage": correctPercentage,
      "incorrectPercentage": incorrectPercentage,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  examSummery['correctPercentage']! > 40 ? 'Congratulation!' : "Whoops, sorry...",
                  style: const TextStyle(
                    color: Color(0xff383A44),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                PieChartWidget(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                  aspectRatio: 1,
                  centerSpaceRadius: 100,
                  touchedIndex: touchedIndex,
                  sections: List.generate(2, (i) {
                    final isTouched = i == touchedIndex;
                    final fontSize = isTouched ? 20.0 : 16.0;
                    final radius = isTouched ? 40.0 : 35.0;
                    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                    switch (i) {
                      case 0: // incorrect
                        return PieChartSectionData(
                          color: const Color(0xFFF59304),
                          value: examSummery['incorrectPercentage'],
                          title: '${examSummery['incorrectPercentage']?.toInt()}%',
                          borderSide: const BorderSide(width: 0),
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: shadows,
                          ),
                        );
                      case 1: // correct
                        return PieChartSectionData(
                          color: const Color(0xFF4E74F9),
                          value: examSummery['correctPercentage'],
                          title: '${examSummery['correctPercentage']?.toInt()}%',
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
                ),
                Text(
                  examSummery['correctPercentage']! > 40 ? 'Driving Test Passed' : 'Driving Test Failed',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff21205A),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${examSummery['correctAnswers']?.toInt()}/${examSummery['totalQuestions']?.toInt()}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xff383A44),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          const Text(
                            'Results',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff383A44),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            '19:20',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff383A44),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          Text(
                            'Time',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff383A44),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFDCD55),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const ExamDashboardScreen();
                          },
                        ),
                        (_) => false,
                      );
                    },
                    child: const Text(
                      "Exam Dashboard",
                      style: TextStyle(color: Color(0xff383A44), fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
