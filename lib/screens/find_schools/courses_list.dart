import 'package:drive_easy_app/screens/find_schools/widgets/course_info_card.dart';
import 'package:flutter/material.dart';
import 'package:drive_easy_app/screens/find_schools/models/school_model.dart';

class CoursesList extends StatelessWidget {
  List<Course> courses;
  CoursesList({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(""),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
            Text(
              "Courses",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),

            // Card
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (BuildContext context, int index) {
                  Course course = courses[index];
                  return 
                  CourseCard(course : course);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
