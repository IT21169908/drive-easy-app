import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

class schoolRegistration extends StatefulWidget {
  const schoolRegistration({super.key});

  @override
  State<schoolRegistration> createState() => _schoolRegistrationState();
}

class _schoolRegistrationState extends State<schoolRegistration> {
  TextEditingController schoolNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactNoController1 = TextEditingController();
  TextEditingController contactNoController2 = TextEditingController();
  TextEditingController aboutUsController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  File? file;
  ImagePicker image = ImagePicker();
  DatabaseReference? dbRef;

  Future<void> _getUserLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position userPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    double userLat = userPosition.latitude;
    double userLon = userPosition.longitude;

    // Update the text in the TextField
    locationController.text = "${userLat}, ${userLon}";
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  String imageToBase64(File imageFile) {
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  Future<void> uploadData() async {
    try {
      if (file != null) {
        String base64Image = base64Encode(file!.readAsBytesSync());

        String locationText = locationController.text;

        if (locationText.isNotEmpty) {
          List<String> locationParts = locationText.split(', ');

          if (locationParts.length == 2) {
            double userLat = double.tryParse(locationParts[0]) ?? 0.0;
            double userLon = double.tryParse(locationParts[1]) ?? 0.0;

            Map<String, dynamic> schoolData = {
              'schoolName': schoolNameController.text,
              'address': addressController.text,
              'contactNo1': contactNoController1.text,
              'contactNo2': contactNoController2.text,
              'aboutUs': aboutUsController.text,
              'location': {
                'latitude': userLat,
                'longitude': userLon,
              },
              'imageBase64': base64Image,
            };

            dbRef!.push().set(schoolData);
          } else {
            print("Invalid location format in locationController");
          }
        } else {
          print("Location is empty in locationController");
        }
      }
    } catch (e) {
      // Handle errors
      print("Error uploading data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('schools');
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
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Register Driving School",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Click to see more details of the course",
                textAlign: TextAlign.justify,
                style:
                    TextStyle(fontWeight: FontWeight.w200, color: Colors.grey),
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Driving School Name',
                    style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: schoolNameController,
                decoration: InputDecoration(
                  hintText: 'ABC learners',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Address', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: 'No.123, Perera Place, Colombo 11',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Contact Number 1',
                    style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: contactNoController1,
                decoration: InputDecoration(
                  hintText: '0112523456',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Contact Number 2',
                    style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: contactNoController2,
                decoration: InputDecoration(
                  hintText: '0772523456',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10,
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('About Us', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: aboutUsController,
                decoration: InputDecoration(
                  hintText: 'Tell us about your driving school...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10,
                  ),
                ),
                minLines: 4,
                maxLines: null,
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Location', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: '',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _getUserLocation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.grey.shade200, // Light grey background color
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(
                        Icons.gps_fixed,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Image', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 25.0),
              Center(
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(
                          255, 180, 180, 180), // Lighter grey color
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(15.0), // Border radius
                  ),
                  child: file == null
                      ? IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 90,
                            color: Color.fromARGB(
                                255, 180, 180, 180), // Lighter grey color
                          ),
                          onPressed: () {
                            getImage();
                          },
                        )
                      : MaterialButton(
                          height: 100,
                          child: Image.file(
                            file!,
                            fit: BoxFit.fill,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                ),
              ),
              SizedBox(height: 25.0),
              MaterialButton(
                onPressed: () {
                  uploadData();
                },
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                color: Colors.indigo.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  "Proceed",
                  style: TextStyle(color: Colors.white, fontSize: 16.00),
                ),
              ),
              SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }
}
