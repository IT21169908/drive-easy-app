import 'package:drive_easy_app/screens/students/exams/widgets/question_screen.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class McqExamScreen extends StatefulWidget {
  const McqExamScreen({super.key});

  @override
  State<McqExamScreen> createState() => _McqExamScreenState();
}

class _McqExamScreenState extends State<McqExamScreen> {
  int currentQuestion = 0;

  final List questions = [
    {
      "text": "When skidding, if the rear end of the car is skidding to the right, turn your wheel to the:",
      "options": {
        "option_id_0": "Slowly and safely accelerate while steering in the direction of the skid",
        "option_id_1": "Turn your front wheels in the same direction that the rear of the vehicle is sliding",
        "option_id_2": "If your car does start to skid, take your foot off the gas, keep both hands on the wheel",
      },
      "correct_option_id": "option_id_0",
    },
    {
      "text": "What should you do if fog closes in completely while you are driving, and visibility is reduced to near zero?",
      "options": {
        "option_id_0": "Slow down and take a detour",
        "option_id_1": "Use your low beams",
        "option_id_2": "Carefully pull as far off the road",
      },
      "correct_option_id": "option_id_2",
    },
    {
      "text": "What does a yellow traffic light indicate?",
      "options": {
        "option_id_0": "Stop",
        "option_id_1": "Proceed with caution",
        "option_id_2": "Speed up",
        "option_id_3": "Turn around",
      },
      "correct_option_id": "Proceed with caution"
    },
    {
      "text": "What does this road sign mean?",
      "image_url": "https://example.com/road_sign.png",
      "options": {
        "option_id_0": "No entry",
        "option_id_1": "Yield",
        "option_id_2": "Stop",
        "option_id_3": "One way",
      },
      "correct_option_id": "option_id_1"
    },
    {
      "text": "What is the maximum speed limit on a highway?",
      "options": {
        "option_id_0": "50 mph",
        "option_id_1": "65 mph",
        "option_id_2": "100 mph",
        "option_id_3": "55 mph",
      },
      "correct_option_id": "option_id_2"
    },
    {
      "text": "What should you do if your brakes fail?",
      "options": {
        "option_id_0": "Panic",
        "option_id_1": "Turn off the engine",
        "option_id_2": "Shift to a lower gear",
        "option_id_3": "Use the handbrake",
      },
      "correct_option_id": "option_id_2"
    }
  ];

  setCurrentQuestion(int index) {
    if (kDebugMode) {
      print("setCurrentQuestion: $index");
      print("questions.length: ${questions.length}");
    }
    int validLength = questions.length - 1;
    if (mounted) {
      setState(() {
        currentQuestion = index > validLength ? validLength : (index < 0 ? 0 : index);
      });
      if (kDebugMode) {
        print("currentQuestion: $currentQuestion");
      }
    }
  }

  setAnswer(String answerKey) {
    if (kDebugMode) {
      print("setAnswer: $answerKey");
    }
    setState(() {
      questions[currentQuestion]['given_answer'] = answerKey;
    });
    if (kDebugMode) {
      print("questions[$currentQuestion] given_answer: ${questions[currentQuestion]['given_answer']}");
      print("given_answer: ${questions[currentQuestion]['given_answer']} | correct answer: ${questions[currentQuestion]['correct_option_id']}");
    }
  }

  bool finishTheExam() {
    bool allAnswersSelected = questions.every((question) {
      return question.containsKey('given_answer') && question['given_answer'] != null;
    });

    if (!allAnswersSelected) {
      AppSnackBarWidget(context: context).show(message: "Please Answers to the all the questions!");
      if (kDebugMode) {
        print('Not all answers selected!');
      }
      // Add code to display a snackbar or handle the case where not all answers are selected
    } else {
      if (kDebugMode) {
        print('All answers selected!');
      }
      // Proceed with the next step
    }

    return allAnswersSelected;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppToastWidget("You cannot exit from the exam until you finish!.");
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const TopAppBar(),
                      const SizedBox(height: 20),
                      QuestionScreen(
                        question: questions[currentQuestion],
                        questionCount: questions.length,
                        currentQuestion: currentQuestion,
                        setCurrentQuestion: setCurrentQuestion,
                        setAnswer: setAnswer,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (questions.length <= (currentQuestion + 1))
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(105, 105, 105, 0.10000000149011612),
                        offset: Offset(-4, -4),
                        blurRadius: 25,
                      ),
                    ],
                    color: Color.fromRGBO(253, 205, 85, 1),
                  ),
                  child: MaterialButton(
                    onPressed: finishTheExam,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Finish the test 🏁',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF383A44),
                          fontSize: 18,
                          letterSpacing: -0.23999999463558197,
                          fontWeight: FontWeight.w500,
                          height: 1.75,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
