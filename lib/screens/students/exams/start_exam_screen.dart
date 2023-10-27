import 'package:drive_easy_app/screens/students/exams/mcq_exam_screen.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class StartExamScreen extends StatefulWidget {
  const StartExamScreen({super.key});

  @override
  State<StartExamScreen> createState() => _StartExamScreenState();
}

class _StartExamScreenState extends State<StartExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/exam-bg-decoration-4.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment(-1, 0),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopAppBar(),
                          SizedBox(height: 20),
                          Text(
                            'Start Exam',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(22, 28, 43, 1),
                              fontSize: 31,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Light vehicle courses, Heavy vehicle\ncourses, Tourist and International\ncourses',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(111, 111, 121, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "assets/images/clip-arts/exam-start.png",
                        alignment: const Alignment(-1, -1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4E74F9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const McqExamScreen(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: const Text(
                  "START EXAM",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
