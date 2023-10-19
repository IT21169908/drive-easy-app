import 'package:flutter/material.dart';
import 'package:drive_easy_app/screens/find_schools/widgets/driving_school_info_card.dart';
import 'package:drive_easy_app/screens/find_schools/models/school_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:great_circle_distance_calculator/great_circle_distance_calculator.dart';

class Schools extends StatefulWidget {
  Schools({Key? key}) : super(key: key);

  @override
  State<Schools> createState() => _SchoolsState();
}

class _SchoolsState extends State<Schools> {
  List<School> schoolData = DummyData.generateSchoolData(5);

  ///location of user
  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position userPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double userLat = userPosition.latitude;
    double userLng = userPosition.longitude;
    filterSchoolsByDistance(schoolData, userLat, userLng);
  }

  void filterSchoolsByDistance(
      List<School> schools, double userLat, double userLng) {
    // Filter the list based on distance <= 30000 meters
    List<School> filteredSchools = schools.where((school) {
      double distance = calculateDistance(
          userLat, userLng, school.latitude, school.longitude);
      return distance <= 30000;
    }).toList();

    setState(() {
      schoolData = filteredSchools;
    });

    print(schoolData);
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    var distance = GreatCircleDistance.fromDegrees(
      latitude1: lat1,
      longitude1: lng1,
      latitude2: lat2,
      longitude2: lng2,
    );
    return double.parse(distance.haversineDistance().toStringAsFixed(2));
  }

  //popup sheet
  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      builder: (context) => Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
              //title and close button
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
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
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
                    SizedBox(height: 20.0),
                    //slider
                    Container(child: SliderExample()),
                    SizedBox(height: 30.0),
                    //2 button

                    MaterialButton(
                      onPressed: getLocation,
                      minWidth: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      color: Colors.indigo.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        "Apply",
                        style: TextStyle(color: Colors.white, fontSize: 16.00),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    onTap: () => _displayBottomSheet(context),
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
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 4;

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
        });
      },
    );
  }
}
