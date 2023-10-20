import 'package:drive_easy_app/widgets/cards/course_material_card.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/widgets.g.dart';

class StudyMaterialsListScreen extends StatefulWidget {
  const StudyMaterialsListScreen({super.key});

  @override
  State<StudyMaterialsListScreen> createState() => _StudyMaterialsListScreenState();
}

class _StudyMaterialsListScreenState extends State<StudyMaterialsListScreen> {
  List<Map<String, String>> materialList = [
    {
      'image': 'assets/images/courses/dead-end.png',
      'title': 'Learner Drivers First Ever Driving Lesson - #1',
      'subtitle': '25 min',
    },
    {
      'image': 'assets/images/courses/busy-road.png',
      'title': 'Driving On Busy Main Roads For The First Time - Driving Lesson #2',
      'subtitle': '20 min',
    },
    {
      'image': 'assets/images/courses/turn-right.png',
      'title': 'How To Turn Right At A T Junction - Driving Lesson #3',
      'subtitle': '30 min',
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
                "Study Material",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  Map<String, String> material = materialList[index];
                  return CourseMaterialItemCard(
                    image: Image.asset(
                      material['image']!,
                    ),
                    title: material['title']!,
                    onPressed: () {},
                    subtitle: material['subtitle']!,
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
