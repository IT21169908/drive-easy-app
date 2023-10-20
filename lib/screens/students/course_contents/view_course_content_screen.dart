import 'package:drive_easy_app/screens/students/course_contents/study_materials/study_materials_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../widgets/cards/course_content_card.dart';
import '../../../widgets/widgets.g.dart';

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
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.fromLTRB(25, 20, 10, 20),
                image: SvgPicture.asset(
                  "assets/images/enrolled-course-card-girl.svg",
                ),
                child: const Column(
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
                onPressed: () {},
              ),
              CourseContentItemCard(
                margin: const EdgeInsets.only(bottom: 10),
                image: SvgPicture.asset(
                  "assets/images/practice-questions-icon.svg",
                  width: 40,
                ),
                title: "Practice Questions",
                onPressed: () {},
              ),
              CourseContentItemCard(
                margin: const EdgeInsets.only(bottom: 10),
                image: SvgPicture.asset(
                  "assets/images/tests-icon.svg",
                  width: 40,
                ),
                title: "Tests",
                onPressed: () {},
              ),
              CourseContentItemCard(
                margin: const EdgeInsets.only(bottom: 10),
                image: SvgPicture.asset(
                  "assets/images/exam-results-icon.svg",
                  width: 40,
                ),
                title: "Test Results",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
