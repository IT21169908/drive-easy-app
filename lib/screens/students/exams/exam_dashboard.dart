import 'package:drive_easy_app/screens/students/exams/exam_history_screen.dart';
import 'package:drive_easy_app/screens/students/exams/start_exam_screen.dart';
import 'package:drive_easy_app/screens/students/exams/utils/calculate_exam_summery.dart';
import 'package:drive_easy_app/widgets/banners/exam_page_top_banner.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/auth_checker.dart';
import 'widgets/exam_grid_card.dart';
import 'widgets/exam_pie_chart.dart';

class ExamDashboardScreen extends StatefulWidget {
  const ExamDashboardScreen({super.key});

  @override
  State<ExamDashboardScreen> createState() => _ExamDashboardScreenState();
}

class _ExamDashboardScreenState extends State<ExamDashboardScreen> {
  late final User? loggedUser;

  // Map<String, double>? examSummery;
  // late final List latestExamResult;

  @override
  void initState() {
    loggedUser = FirebaseAuth.instance.currentUser;
    // Query examResultQueryRef = FirebaseDatabase.instance.ref().child('users/${loggedUser?.uid}/exam_results');
    // getLatestExamResult(examResultQueryRef);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkAuthAndLogout(context, mounted, routeName: RouteName.login);
    });
    super.initState();
  }

  // Future<List> getLatestExamResult(Query examResultQueryRef) async {
  //   DatabaseEvent event = await examResultQueryRef.limitToLast(1).once(DatabaseEventType.value);
  //   Map snapshot = event.snapshot.value as Map;
  //   if (kDebugMode) {
  //     print("event.snapshot.value ${snapshot[snapshot.keys.first]}");
  //     print("event.snapshot.key ${event.snapshot.key}");
  //   }
  //   latestExamResult = snapshot[snapshot.keys.first] as List;
  //
  //   if (mounted) {
  //     setState(() {
  //       examSummery = calculatePercentages(latestExamResult);
  //     });
  //   }
  //   if (kDebugMode) {
  //     print("ExamDashboardScreen getLatestExamResult examSummery: $examSummery");
  //   }
  //   return latestExamResult;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopAppBar(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffFFC858),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(95, 95, 95, 0.10000000149011612),
                              offset: Offset(0, 3),
                              blurRadius: 12,
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                              loggedUser?.photoURL ?? 'https://robohash.org/user',
                            ),
                            fit: BoxFit.fitWidth,
                            onError: (error, stackTrace) {
                              if (kDebugMode) {
                                print(":::::::::::::::::::::::: DecorationImage => ${loggedUser?.photoURL} | onError: ${error.toString()}");
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Color(0xff27093E),
                            ),
                          ),
                          Text(
                            loggedUser?.displayName ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff27093E),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const ExamPageTopBanner(
                    child: Center(
                      child: Text(
                        "09 : 12 : 12",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Latest exam result',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF27093E),
                          fontSize: 21,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const ExamHistory(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.scale,
                          );
                        },
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xE018093E),
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //if (examSummery != null)
                  FirebaseAnimatedList(
                    query: FirebaseDatabase.instance.ref().child('users/${loggedUser?.uid}/exam_results').limitToLast(1),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                      // Map result = snapshot.value as Map;
                      List latestExamResult = snapshot.value as List;
                      Map<String, double> summery = calculatePercentages(latestExamResult);
                      return ExamPieChartInfo(examSummery: summery);
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Available exams',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF27093E),
                      fontSize: 21,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20),
                    crossAxisCount: 2,
                    // childAspectRatio: width/height
                    childAspectRatio: (MediaQuery.of(context).size.width / 2) / 235,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: [
                      ExamGridCard(
                        asset: "assets/images/courses/exam-grid-img.png",
                        title: 'MCQ Exam 1',
                        subtitle: '30 Questions',
                        examDuration: '1 Hour',
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const StartExamScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.scale,
                          );
                        },
                      ),
                      ExamGridCard(
                        asset: "assets/images/courses/exam-grid-img-2.png",
                        title: 'MCQ Exam 2',
                        subtitle: '60 Questions',
                        examDuration: '1 Hour',
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const StartExamScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.scale,
                          );
                        },
                      ),
                      ExamGridCard(
                        asset: "assets/images/courses/exam-grid-img-3.png",
                        title: 'MCQ Exam 3',
                        subtitle: '25 Questions',
                        examDuration: '30 Min',
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const StartExamScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.scale,
                          );
                        },
                      ),
                      ExamGridCard(
                        asset: "assets/images/courses/exam-grid-img-5.png",
                        title: 'MCQ Exam 4',
                        subtitle: '30 Questions',
                        examDuration: '1 Hour',
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const StartExamScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.scale,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
