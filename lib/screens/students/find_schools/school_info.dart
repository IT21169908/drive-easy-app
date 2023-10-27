import 'dart:convert';
import 'dart:typed_data';

import 'package:drive_easy_app/models/models.dart';
import 'package:drive_easy_app/screens/students/find_schools/courses_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:map_launcher/map_launcher.dart';

class SchoolInfo extends StatelessWidget {
  final School school;

  const SchoolInfo({super.key, required this.school});

  //get directions button
  Future<void> openMap(double latitude, double longitude) async {
    final availableMaps = await MapLauncher.installedMaps;

    if (availableMaps.isNotEmpty) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(latitude, longitude),
        title: "Destination",
      );
    } else {
      throw 'No maps installed.';
    }
  }

  @override
  Widget build(BuildContext context) {
    String base64ImageFromDatabase = school.imageBase64;

    // Decode the base64 string back to bytes.
    Uint8List bytes = base64Decode(base64ImageFromDatabase);

    // Create an image from the bytes.
    Image image = Image.memory(bytes);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image.image, // Extract the ImageProvider from the Image widget
                          fit: BoxFit.fill, // Replace with your desired BoxFit
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10, // Adjust the top position as needed
                    left: 10, // Adjust the left position as needed
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      color: Colors.black, // Icon color
                      iconSize: 32, // Icon size
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              //school info
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          school.schoolName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      //location
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.place,
                            color: Colors.grey.shade400,
                            size: 30.0,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            school.address,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),

                      //telephone
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.grey.shade400,
                            size: 30.0,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            "${school.contactNo1} / ${school.contactNo2}",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                      //telephone
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_car,
                            color: Colors.grey.shade400,
                            size: 30.0,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            school.distance >= 1 ? '${school.distance.toStringAsFixed(1)} km' : '${(school.distance * 1000).toInt()} m',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                      //view button
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => CourseListScreen(school: school)),
                          );
                        },
                        minWidth: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                        color: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Text(
                          "View Available Courses",
                          style: TextStyle(color: Colors.black, fontSize: 16.00),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //about us
                    const Text(
                      "About Us",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        school.aboutUs,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontWeight: FontWeight.w200, color: Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    //2 buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            openMap(school.latitude, school.longitude);
                          },
                          minWidth: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                          color: Colors.indigo.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Text(
                            "Get Directions",
                            style: TextStyle(color: Colors.white, fontSize: 16.00),
                          ),
                        ),
                        const SizedBox(width: 25.0),
                        MaterialButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30.0),
                                ),
                              ),
                              builder: (context) => const rateNowScreen(),
                            );
                          },
                          minWidth: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Text(
                            "Rate",
                            style: TextStyle(color: Colors.white, fontSize: 16.00),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                      width: 50,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class rateNowScreen extends StatefulWidget {
  const rateNowScreen({super.key});

  @override
  State<rateNowScreen> createState() => _rateNowScreenState();
}

class _rateNowScreenState extends State<rateNowScreen> {
  double userRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            //close button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.grey.shade700,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            //title and close button
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.tune,
                  color: Colors.black,
                  size: 30.0,
                ),
                SizedBox(width: 5.0),
                Text(
                  "RATE NOW",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15.0),
            //text
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                "How was your experience with this driving school ?",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                  wordSpacing: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            //body
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                userRating = rating;
                print(rating);
              },
            ),

            //button
            const SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () {},
              minWidth: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              color: Colors.indigo.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 16.00),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
