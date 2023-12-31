import 'package:drive_easy_app/screens/students/course_contents/road_signs/categorize_road_signs_list_screen.dart';
import 'package:drive_easy_app/screens/students/course_contents/tutorials/study_materials_list_screen.dart';
import 'package:drive_easy_app/screens/students/exams/exam_history_screen.dart';
import 'package:drive_easy_app/screens/students/exams/start_exam_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../widgets/cards/course_content_card.dart';
import '../../../widgets/widgets.g.dart';
import '../exams/exam_dashboard.dart';

class ViewCourseContentScreen extends StatefulWidget {
  const ViewCourseContentScreen({super.key});

  @override
  State<ViewCourseContentScreen> createState() => _ViewCourseContentScreenState();
}

class _ViewCourseContentScreenState extends State<ViewCourseContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopAppBar(),
              const SizedBox(height: 20),
              ScreenTopBanner(
                image: SvgPicture.asset("assets/images/enrolled-course-card-girl.svg"),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Light Vehicle",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "ABS Learners",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "0% Completed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CourseContentItemCard(
                margin: const EdgeInsets.only(bottom: 10),
                image: SvgPicture.asset(
                  "assets/images/study-materiel-icon.svg",
                  width: 40,
                ),
                title: "Study",
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudyMaterialsListScreen()()));
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const StudyMaterialsListScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.scale,
                  );
                },
              ),
              CourseContentItemCard(
                margin: const EdgeInsets.only(bottom: 10),
                image: SvgPicture.asset(
                  "assets/images/road-sign.svg",
                  width: 40,
                ),
                title: "Road Signs",
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const CategorizeRoadSignsListScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.scale,
                  );
                },
              ),
              CourseContentItemCard(
                margin: const EdgeInsets.only(bottom: 10),
                image: SvgPicture.asset(
                  "assets/images/practice-questions-icon.svg",
                  width: 40,
                ),
                title: "Practice Questions",
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const StartExamScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              CourseContentItemCard(
                margin: const EdgeInsets.only(bottom: 10),
                image: SvgPicture.asset(
                  "assets/images/tests-icon.svg",
                  width: 40,
                ),
                title: "Tests",
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const ExamDashboardScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
              CourseContentItemCard(
                margin: const EdgeInsets.only(bottom: 10),
                image: SvgPicture.asset(
                  "assets/images/exam-results-icon.svg",
                  width: 40,
                ),
                title: "Test Results",
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const ExamHistory(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
