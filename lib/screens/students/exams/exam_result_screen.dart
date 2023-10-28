import 'package:drive_easy_app/screens/students/exams/utils/calculate_exam_summery.dart';
import 'package:drive_easy_app/screens/students/layouts/dashboard_layout.dart';
import 'package:fl_chart/fl_chart.dart';
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
    examSummery = calculatePercentages(widget.answeredQuestions);
    super.initState();
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
              children: [
                const TopAppBar(),
                const SizedBox(height: 40),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  examSummery: examSummery,
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
                            return const StudentDashboardLayout();
                          },
                        ),
                        (_) => false,
                      );
                    },
                    child: const Text(
                      "Home",
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
