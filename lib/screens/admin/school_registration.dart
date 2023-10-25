import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class schoolRegistration extends StatefulWidget {
  const schoolRegistration({super.key});

  @override
  State<schoolRegistration> createState() => _schoolRegistrationState();
}

class _schoolRegistrationState extends State<schoolRegistration> {
  @override
  Widget build(BuildContext context) {
    TextEditingController schoolNameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController contactNoController1 = TextEditingController();
    TextEditingController contactNoController2 = TextEditingController();
    TextEditingController aboutUsController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    File? _image;

    Future<void> _getUserLocation() async {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position userPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double userLat = userPosition.latitude;
      double userLon = userPosition.longitude;

      // Update the text in the TextField
      locationController.text = "Latitude: ${userLat}, Longitude: ${userLon}";
    }

    Future<void> _getImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
          source: ImageSource
              .gallery); // You can use ImageSource.camera to open the camera

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    }

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
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(8.0), // Add padding
                    child: Center(
                      child: _image == null
                          ? Icon(
                              Icons.add_a_photo,
                              color: Colors.grey,
                              size: 50,
                            )
                          : Image.file(_image!, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              MaterialButton(
                onPressed: () {},
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
