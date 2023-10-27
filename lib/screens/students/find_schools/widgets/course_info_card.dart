import 'package:drive_easy_app/models/models.dart';
import 'package:drive_easy_app/screens/students/find_schools/course_info.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CourseInfo(course: course)),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 10.0),
        elevation: 5, // Add elevation for a shadow effect
        color: Colors.white, // Set the color to white
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Image
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://www.lifewire.com/thmb/pe-HqOKptr9JMz-ILbvCTnbF8BQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/The10BestEducationalWebsitesforTakingOnlineCoursesin2021-final-a1b955b29f624dfc84645c86f33d6c3b.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              // Course information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade900,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "LKR ${course.price}",
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Trailing icon
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
