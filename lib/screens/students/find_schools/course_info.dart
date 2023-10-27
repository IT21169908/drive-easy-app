import 'package:drive_easy_app/screens/students/find_schools/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:drive_easy_app/screens/students/find_schools/models/school_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CourseInfo extends StatelessWidget {
  final Course course;

  CourseInfo({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          minHeight: MediaQuery.of(context).size.height * 0.7,
          maxHeight: MediaQuery.of(context).size.height * 0.9,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          body: Stack(
            children: [
              Image.network(
                'https://www.lifewire.com/thmb/pe-HqOKptr9JMz-ILbvCTnbF8BQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/The10BestEducationalWebsitesforTakingOnlineCoursesin2021-final-a1b955b29f624dfc84645c86f33d6c3b.jpg',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.chevron_left),
                  color: Colors.black,
                  iconSize: 32,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          panelBuilder: (controller) => PanelWidget(
            controller: controller,
            course: course,
          ),
        ),
      ),
    );
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final Course course;

  const PanelWidget({Key? key, required this.controller, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                buildDragHandle(),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      // Wrap in Flexible to prevent overflow
                      child: Text(
                        course.name,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
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
                          "LKR ${course.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                Divider(thickness: 0.4),
                //start course button
                MaterialButton(
                  onPressed: () {
                    // Add your logic here
                  },
                  minWidth: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    "Start Course",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.00,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "About Course",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  course.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.w200, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildDragHandle() => Center(
      child: Container(
        width: 30,
        height: 5,
        decoration: BoxDecoration(color: Colors.grey.shade300),
      ),
    );
