import 'dart:developer';

import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class VehicleDetails extends StatefulWidget {
  final String vehicleNo;

  const VehicleDetails({
    super.key,
    required this.vehicleNo,
  });

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  final GlobalKey<ExpandableBottomSheetState> _bottomSheetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableBottomSheet(
        key: _bottomSheetKey,
        enableToggle: true,
        background: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    TopAppBar(),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: ThemeConsts.appPrimaryColorLight,
                  borderRadius: BorderRadius.all(Radius.circular(36)),
                ),
                margin: const EdgeInsets.only(top: 0, bottom: 15),
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/track-vehicles/default_cover_vehicle_img.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "INFORMATION",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Vehicle Name: Toyota Corolla \n"
                                "Model Year: 2022 \n"
                                "Make: Toyota \n"
                                "Model: Corolla \n"
                                "License Plate: ABC 123 \n"
                                "Fuel Type: Gasoline \n"
                                "Mileage: 30 MPG \n"
                                "Seating Capacity: 5 seats \n"
                                "Color: Red \n"
                                "Transmission: Automatic",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SAFETY FEATURES",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Equipped with advanced safety features, including adaptive cruise control, lane departure warning, and automatic emergency braking.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ABOUT THE VEHICLE",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "The Toyota Corolla is a popular choice among our students for its excellent fuel efficiency, ease of handling, and reliability. It's an ideal vehicle for both beginners and those looking to refine their driving skills. With spacious seating for up to five passengers, a user-friendly infotainment system, and a smooth ride, it offers a comfortable and secure environment for your driving lessons.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              child: const Text(
                                "REVIEWS",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: double.infinity,
                              height: 48,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 15),
                                  RatingBar.builder(
                                    initialRating: 4,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 24,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    // Padding between stars
                                    itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                                    onRatingUpdate: (rating) {
                                      log(rating.toString());
                                    },
                                  ),
                                  const Text(
                                    "(50 reviews)",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.grey,
                                    size: 50,
                                  ),
                                  const SizedBox(width: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "PHOTOS",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  buildRoundedImage('assets/images/track-vehicles/toyota_corolla_1.jpeg'),
                                  buildRoundedImage('assets/images/track-vehicles/toyota_corolla_2.jpeg'),
                                  buildRoundedImage('assets/images/track-vehicles/default_cover_vehicle_img.jpg'),
                                  buildRoundedImage('assets/images/track-vehicles/toyota_corolla_1.jpeg'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        expandableContent: const SizedBox(),
        animationDurationExtend: const Duration(milliseconds: 500),
        animationCurveExpand: Curves.easeIn,
      ),
    );
  }

  Widget buildRoundedImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Image.asset(
        imagePath,
        width: 75,
        height: 75,
        fit: BoxFit.cover,
      ),
    );
  }
}
