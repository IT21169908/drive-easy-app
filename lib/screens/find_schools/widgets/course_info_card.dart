import 'package:drive_easy_app/screens/find_schools/models/school_model.dart';
import 'package:drive_easy_app/screens/find_schools/course_info.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  Course course;
  CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CourseInfo(course : course)),
          );
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade200,
            boxShadow: const [
              BoxShadow(
                offset: Offset(8, 4),
                blurRadius: 25,
                spreadRadius: 0,
                color: Color(0x15000000),
              )
            ],
          ),
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //leading icon
                    Container(
                      child: Icon(Icons.school),
                    ),

                    SizedBox(width: 20.0),
                    //course name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(course.name,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Text(course.price.toString()),
                      ],
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),

                //trailing icon
                Container(
                  child: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
