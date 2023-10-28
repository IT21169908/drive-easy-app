import 'package:drive_easy_app/screens/students/exams/exam_result_screen.dart';
import 'package:drive_easy_app/screens/students/exams/utils/calculate_exam_summery.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/auth_checker.dart';

class ExamHistory extends StatefulWidget {
  const ExamHistory({super.key});

  @override
  State<ExamHistory> createState() => _ExamHistoryState();
}

class _ExamHistoryState extends State<ExamHistory> {
  late Query examResultQueryRef;
  late final User? loggedUser;

  @override
  void initState() {
    loggedUser = FirebaseAuth.instance.currentUser;
    examResultQueryRef = FirebaseDatabase.instance.ref().child('users/${loggedUser?.uid}/exam_results');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkAuthAndLogout(context, mounted, routeName: RouteName.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const TopAppBar(),
              const SizedBox(height: 20),
              const Text(
                'Test Result Overview',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(62, 62, 71, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FirebaseAnimatedList(
                query: examResultQueryRef,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                  List answeredQuestions = snapshot.value as List;
                  if (kDebugMode) {
                    print("FirebaseAnimatedList ${answeredQuestions[0]['text']}");
                  }
                  final Map<String, double> examSummery = calculatePercentages(answeredQuestions);
                  bool isExamPassed = examSummery['correctPercentage']! > 40;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: isExamPassed ? const Color(0xffDDF0E6) : const Color(0xffFDE4E4),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: ExamResultScreen(answeredQuestions: answeredQuestions),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.scale,
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Status of the test',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff3E3E47),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                isExamPassed ? 'PASSED' : 'FAILED',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: isExamPassed ? const Color(0xff28A164) : const Color(0xffF35555),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const Divider(thickness: 0.4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Number of correct answers',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff3E3E47),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '${examSummery['correctAnswers']?.toInt()}/${examSummery['totalQuestions']?.toInt()}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xff383A44),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          const Divider(thickness: 0.4),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Learning Time',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff3E3E47),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '27 Min',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff3E3E47),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                  // }
                  // return const SizedBox();
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
