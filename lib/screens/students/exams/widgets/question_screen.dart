import 'package:drive_easy_app/screens/students/exams/widgets/question_answer_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionScreen extends StatelessWidget {
  final int currentQuestion;
  final int questionCount;
  final Map question;
  final Function(int index) setCurrentQuestion;
  final Function(String answerKey) setAnswer;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.setCurrentQuestion,
    required this.currentQuestion,
    required this.questionCount,
    required this.setAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Question ${currentQuestion + 1}",
              style: const TextStyle(
                color: Color(0xff21205A),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const Text(
              "⏱ 3:48",
              style: TextStyle(
                color: Color(0xff383A44),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: LinearPercentIndicator(
                padding: EdgeInsets.zero,
                lineHeight: 15.0,
                percent: (((currentQuestion + 1) / questionCount) * 100) / 100,
                barRadius: const Radius.circular(10),
                backgroundColor: const Color(0x71fdcd55),
                progressColor: const Color(0xfff8c545),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "${currentQuestion + 1}/$questionCount",
              style: const TextStyle(
                color: Color(0xff21205A),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "When skidding, if the rear end of the car is skidding to the right, turn your wheel to the:",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xff383A44),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Image.asset("assets/images/courses/mcq-1.png"),
        ),
        const SizedBox(height: 20),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: question['options'].length,
          separatorBuilder: (context, index) => const SizedBox(height: 14),
          itemBuilder: (context, index) {
            if (kDebugMode) {
              print("question['options']['option_id_$index']: ${question['options']['option_id_$index']}");
            }
            Map option = question['options'];
            return QuestionAnswer(
              onPressed: () {
                setAnswer('option_id_$index');
              },
              question: question,
              isAnswerSelected: 'option_id_$index' == question['given_answer'],
              answerText: option['option_id_$index'],
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: currentQuestion > 0 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
          children: [
            if (currentQuestion > 0)
              Container(
                width: 150,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(8, 4),
                      blurRadius: 25,
                      spreadRadius: 0,
                      color: Color(0x15000000),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: () {
                    if (kDebugMode) {
                      print("currentQuestion: $currentQuestion");
                    }
                    setCurrentQuestion(currentQuestion - 1);
                  },
                  child: const Center(
                    child: Text(
                      "Previous",
                      style: TextStyle(color: Color(0xff383A44)),
                    ),
                  ),
                ),
              ),
            if (questionCount > (currentQuestion + 1))
              Container(
                width: 150,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(8, 4),
                      blurRadius: 25,
                      spreadRadius: 0,
                      color: Color(0x15000000),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4378DB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: () {
                    if (kDebugMode) {
                      print("currentQuestion: $currentQuestion");
                    }
                    setCurrentQuestion(currentQuestion + 1);
                  },
                  child: const Center(
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
