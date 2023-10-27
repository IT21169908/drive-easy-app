import 'dart:math';

import 'package:drive_easy_app/models/models.dart';
import 'package:drive_easy_app/screens/students/find_schools/widgets/driving_school_info_card.dart';
import 'package:drive_easy_app/screens/students/find_schools/widgets/filter_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Schools extends StatefulWidget {
  const Schools({super.key});

  @override
  State<Schools> createState() => _SchoolsState();
}

class _SchoolsState extends State<Schools> {
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('schools');
  List<School> schoolData = [];
  List<School> schoolDataCopy = [];
  double sliderValue = 4.0;
  double userLat = 0.0;
  double userLon = 0.0;

//fetch school data
  Future<void> fetchSchoolData() async {
    DatabaseEvent event = await dbRef.once();
    DataSnapshot dataSnapshot = event.snapshot;

    List<School> tempList = [];

    if (dataSnapshot.value != null) {
      Map<dynamic, dynamic> data = dataSnapshot.value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        School school = School(
          schoolName: value['schoolName'],
          address: value['address'],
          contactNo1: value['contactNo1'],
          contactNo2: value['contactNo2'],
          aboutUs: value['aboutUs'],
          latitude: value['latitude'],
          longitude: value['longitude'],
          imageBase64: value['imageBase64'],
          id: key,
        );
        tempList.add(school);
      });
    }

    setState(() {
      schoolData = tempList;
    });

    //////////////////////////////
    // After obtaining the user's location, calculate distances to schools
    final List<School> schoolsWithDistances = [];

    for (var school in schoolData) {
      double distance = calculateDistance(
        school.latitude,
        school.longitude,
        userLat,
        userLon,
      );
      school.distance = distance;
      schoolsWithDistances.add(school);
    }

    setState(() {
      schoolData = schoolsWithDistances;
      schoolDataCopy = schoolsWithDistances;
    });
  }

//slider
  void onSliderValueReceived(double data) {
    // Process the data received from the child widget.
    setState(() {
      sliderValue = data;
    });

    // Filter schoolData based on the slider value
    schoolData = schoolData.where((school) => school.distance < sliderValue).toList();
    print(schoolData);
  }

  void resetSchoolData() {
    setState(() {
      schoolData = schoolDataCopy; // Reset to the original schoolList
      sliderValue = 0.0; // Reset the slider value
    });
  }

  double radians(double degrees) {
    return degrees * (pi / 180.0);
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // Radius of the Earth in kilometers

    // Convert latitude and longitude from degrees to radians
    lat1 = radians(lat1);
    lon1 = radians(lon1);
    lat2 = radians(lat2);
    lon2 = radians(lon2);

    // Haversine formula
    double dLat = lat2 - lat1;
    double dLon = lon2 - lon1;
    double a = sin(dLat / 2) * sin(dLat / 2) + cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;

    return distance; // Distance in kilometers
  }

  Future<void> _getUserLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position userPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      userLat = userPosition.latitude;
      userLon = userPosition.longitude;
    });

    //////////////////////////////////////////////////////////////////////////////////////////////
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    fetchSchoolData();
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Find Schools",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),

            //search field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey[700],
                        size: 32.0,
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        "Search anything",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      /////////////////////////////////////////////////////////////////////////////
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30.0),
                            ),
                          ),
                          builder: (context) => filterScreen(
                                callback: onSliderValueReceived,
                                resetCallback: resetSchoolData, // Pass the reset function
                              ));
                    },
                    //////////////////////////////////
                    child: const Icon(
                      Icons.tune,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25.0),

            // Card
            Expanded(
              child: schoolData.isEmpty
                  ? const Center(
                      child: Text(
                        'No driving schools available',
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: schoolData.length,
                      itemBuilder: (BuildContext context, int index) {
                        School school = schoolData[index];
                        return DrivingSchoolInfoCard(school: school);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
