import 'package:drive_easy_app/models/models.dart';
import 'package:drive_easy_app/screens/students/find_schools/widgets/course_info_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class CourseListScreen extends StatefulWidget {
  final School school;

  const CourseListScreen({super.key, required this.school});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  late Query coursesQueryRef;

  @override
  void initState() {
    coursesQueryRef = FirebaseDatabase.instance.ref().child('schools/${widget.school.id}/courses');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(""),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Courses",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Click to see more details of the course",
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w200, color: Colors.grey),
            ),
            const SizedBox(height: 15.0),
            FirebaseAnimatedList(
              query: coursesQueryRef,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                Map<dynamic, dynamic> json = snapshot.value as Map<dynamic, dynamic>;
                // if (kDebugMode) {
                //   print("FirebaseAnimatedList $json");
                // }
                // if (json is Map<String, dynamic>) {
                json['id'] = snapshot.key;
                json['school'] = widget.school.toJson();
                Course course = Course.fromJson(json);
                return CourseCard(course: course);
                // }
                // return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
