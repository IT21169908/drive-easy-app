import 'package:drive_easy_app/screens/students/course_contents/road_signs/road_signs_screen.dart';
import 'package:drive_easy_app/widgets/cards/course_content_card.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../widgets/widgets.g.dart';

class CategorizeRoadSignsListScreen extends StatefulWidget {
  const CategorizeRoadSignsListScreen({super.key});

  @override
  State<CategorizeRoadSignsListScreen> createState() => _CategorizeRoadSignsListScreenState();
}

class _CategorizeRoadSignsListScreenState extends State<CategorizeRoadSignsListScreen> {
  List<Map<String, String>> roadSigns = [
    {
      'image': 'assets/images/courses/warning.png',
      'title': 'Warning Signs',
    },
    {
      'image': 'assets/images/courses/priority.png',
      'title': 'Priority',
    },
    {
      'image': 'assets/images/courses/forbidden.png',
      'title': 'Forbidden',
    },
    {
      'image': 'assets/images/courses/regulations.png',
      'title': 'Marks of special regulations',
    },
    {
      'image': 'assets/images/courses/info.png',
      'title': 'Information signs',
    },
    {
      'image': 'assets/images/courses/others.png',
      'title': 'Additional Information signs',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopAppBar(),
              const Text(
                "Road Signs",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 6,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  Map<String, String> material = roadSigns[index];
                  return CourseContentItemCard(
                    image: Image.asset(
                      material['image']!,
                    ),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    title: material['title']!,
                    onPressed: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: RoadSignsScreen(roadSignCategory: material),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.scale,
                      );
                    },
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
