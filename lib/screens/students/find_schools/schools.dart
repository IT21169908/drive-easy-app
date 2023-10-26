import 'package:flutter/material.dart';
import 'package:drive_easy_app/screens/students/find_schools/widgets/driving_school_info_card.dart';
import 'package:drive_easy_app/screens/students/find_schools/models/school_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math'; // Import the dart:math library

class Schools extends StatefulWidget {
  Schools({Key? key}) : super(key: key);

  @override
  State<Schools> createState() => _SchoolsState();
}

class _SchoolsState extends State<Schools> {
  List<School> schoolData = schoolList;
  double sliderValue = 4.0;

  void onSliderValueReceived(double data) {
    // Process the data received from the child widget.
    setState(() {
      sliderValue = data;
      print('value received in the school list screen');
    });

    // Filter schoolData based on the slider value
    schoolData =
        schoolData.where((school) => school.distance < sliderValue).toList();
        print(schoolData);
  }

  void resetSchoolData() {
    setState(() {
      schoolData = schoolList; // Reset to the original schoolList
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
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;

    return distance; // Distance in kilometers
  }

  Future<void> _getUserLocation() async {
    // Code to get the user's current location
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position userPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double userLat = userPosition.latitude;
    double userLon = userPosition.longitude;
    //////////////////////////////////////////////////////////////////////////////////////////////

    // After obtaining the user's location, calculate distances to schools
    final List<School> schoolsWithDistances = [];

    for (var school in schoolData) {
      double distance = calculateDistance(
        school.location.latitude,
        school.location.longitude,
        userLat,
        userLon,
      );
      school.distance = distance;
      schoolsWithDistances.add(school);
    }

    setState(() {
      schoolData = schoolsWithDistances;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Schools",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),

            //search field
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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
                      SizedBox(width: 10.0),
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
                          shape: RoundedRectangleBorder(
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
                    child: Icon(
                      Icons.tune,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),

            // Card
            Expanded(
              child: schoolData.isEmpty
                  ? Center(
                      child: Text(
                        'No driving schools available',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
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

//slider
class SliderExample extends StatefulWidget {
  final Function(double) callback;
  const SliderExample({super.key, required this.callback});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 4;

  double get sliderValue => _currentSliderValue;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 10,
      divisions: 10,
      activeColor: Colors.amber,
      label: _currentSliderValue.round().toString() + "KM",
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
          widget.callback(_currentSliderValue);
          print('passing value from slider');
        });
      },
    );
  }
}

//filter screen
class filterScreen extends StatefulWidget {
  final Function(double) callback;
  final Function resetCallback;
  const filterScreen(
      {super.key, required this.callback, required this.resetCallback});

  @override
  State<filterScreen> createState() => _filterScreenState();
}

class _filterScreenState extends State<filterScreen> {
  double sliderValue = 0;

  void onSliderValueReceived(double data) {
    // Process the data received from the child widget.
    setState(() {
      sliderValue = data;
      print('received slider value to the filter screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //close button
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            //title
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.tune,
                  color: Colors.black,
                  size: 30.0,
                ),
                SizedBox(width: 5.0),
                Text(
                  "Filter",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //body
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //text1
                  Text(
                    "Filter by distance",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),

                  //text2
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "You can filter nearest driving schools upto 10KM",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  //slider
                  Container(
                      child: SliderExample(callback: onSliderValueReceived)),
                  SizedBox(height: 10.0),
                  //2 button

                  MaterialButton(
                    onPressed: () {
                      widget.callback(sliderValue);
                      Navigator.of(context).pop();
                      print(
                          'button click - passing slider value to the school list screen');
                    },
                    minWidth: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    color: Colors.indigo.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      "Apply",
                      style: TextStyle(color: Colors.white, fontSize: 16.00),
                    ),
                  ),
                  SizedBox(height: 10.0),

                  MaterialButton(
                    onPressed: () {
                      widget.resetCallback(); // Call the reset function
                      Navigator.of(context).pop();
                    },
                    minWidth: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white, fontSize: 16.00),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
