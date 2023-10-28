import 'dart:developer';

import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class InstructorProfile extends StatefulWidget {
  const InstructorProfile({super.key});

  @override
  State<InstructorProfile> createState() => _InstructorProfileState();
}

class _InstructorProfileState extends State<InstructorProfile> {
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/track-vehicles/default_cover_img.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 135),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Maneesh Prashanth',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Instructor',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 160,
                            left: 15,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/track-vehicles/default_user.png',
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
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
                                "ABOUT",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "I'm passionate about teaching safe and responsible driving. With over 5 years of experience as a driving instructor, I've had the privilege of helping countless students gain the skills and confidence they need to navigate the roads safely. My teaching approach...See more",
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
                                  buildRoundedImage('assets/images/track-vehicles/instructor_gallery_1.jpg'),
                                  buildRoundedImage('assets/images/track-vehicles/instructor_gallery_2.jpg'),
                                  buildRoundedImage('assets/images/track-vehicles/instructor_gallery_3.jpg'),
                                  buildRoundedImage('assets/images/track-vehicles/instructor_gallery_4.jpg'),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "CONTACTS",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () => launchUrl(Uri.parse("https://www.google.com/search?q=main+social+media+links")),
                                    child: Image.asset(
                                      "assets/images/track-vehicles/social_stack.png",
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () => launchUrl(Uri.parse("tel:0766171525")),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.call,
                                            color: Colors.green,
                                            size: 32,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "+94 76 617 1525",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => launchUrl(Uri.parse("mailto:manishprashanth@gmail.com")),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.mail,
                                            color: Colors.orangeAccent,
                                            size: 32,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "manishprashanth@gmail.com",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
