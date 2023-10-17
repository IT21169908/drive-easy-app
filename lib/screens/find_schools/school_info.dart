import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:map_launcher/map_launcher.dart';

class SchoolInfo extends StatelessWidget {
  const SchoolInfo({super.key});

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

  //rate button popup sheet
  Future _displayRateNowSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      builder: (context) => Container(
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
                    "RATE NOW",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.0),
              //text
              Container(
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
              SizedBox(height: 20.0),
              //body
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),

              //button
              SizedBox(height: 25.0),
              MaterialButton(
                onPressed: () {},
                minWidth: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 16.00),
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
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),

            //image
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),

            //school info
            Container(
              padding: EdgeInsets.all(8.0),
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
                        "School Name Here",
                        style: TextStyle(
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
                        SizedBox(width: 5.0),
                        Text(
                          "Location comes here",
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
                        SizedBox(width: 5.0),
                        Text(
                          "0112 123 456 / 0775 419 752",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //map view
                  Image.network(
                    'http://filiz.it/wp-content/uploads/2016/01/maps_tutorial.png',
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 300.0,
                    fit: BoxFit.fitWidth,
                  ),

                  SizedBox(height: 20.0),
                  //2 buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          openMap(37.7749, -122.4194);
                        },
                        minWidth: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          "Get Directions",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.00),
                        ),
                      ),
                      SizedBox(width: 25.0),
                      MaterialButton(
                        onPressed: () {
                          _displayRateNowSheet(context);
                        },
                        minWidth: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          "Rate",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.00),
                        ),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
