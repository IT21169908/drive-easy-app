import 'package:drive_easy_app/screens/students/find_schools/school_info.dart';
import 'package:drive_easy_app/screens/students/find_schools/models/school_model.dart';
import 'package:flutter/material.dart';

class DrivingSchoolInfoCard extends StatelessWidget {
  School school;

  DrivingSchoolInfoCard({super.key, required this.school});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          //card
          GestureDetector(
            onTap: () {},
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //image with title
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //image
                        Container(
                          width: 100, // Set the desired width
                          height: 100, // Set the desired height
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                                'https://houstondrivingschool.net/wp-content/uploads/2020/04/driving-lessons.jpg'),
                          ), // Replace with your image URL
                        ),

                        SizedBox(width: 10.0),
                        //school name
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(school.schoolName,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),

                              SizedBox(height: 10.0),
                              Row(
                                children: [
                                  //rating
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate,
                                        color: Colors.amber,
                                      ),
                                      Text(school.rating.toString()),
                                    ],
                                  ),

                                  SizedBox(width: 15),
                                  //distance
                                  Icon(
                                    Icons.directions_car,
                                    color: Colors.grey.shade600,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    school.distance >= 1
                                        ? '${school.distance.toStringAsFixed(1)} km'
                                        : '${(school.distance * 1000).toInt()} m',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),

                    //location
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.grey.shade400,
                          size: 30.0,
                        ),
                        Text(
                          school.address,
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.0),

                    //view button
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => SchoolInfo(school: school)),
                        );
                      },
                      minWidth: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      color: Colors.indigo.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        "View",
                        style: TextStyle(color: Colors.white, fontSize: 16.00),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
