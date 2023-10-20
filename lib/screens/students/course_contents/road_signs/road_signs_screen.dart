import 'package:drive_easy_app/widgets/cards/course_content_card.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/widgets.g.dart';

class RoadSignsScreen extends StatefulWidget {
  const RoadSignsScreen({super.key, required this.roadSignCategory});

  final Map<String, String> roadSignCategory;

  @override
  State<RoadSignsScreen> createState() => _RoadSignsScreenState();
}

class _RoadSignsScreenState extends State<RoadSignsScreen> {
  List<Map<String, String>> roadSigns = [
    {
      'imageThumb': 'assets/images/courses/railway-cross.png',
      'image': 'assets/images/courses/railway-cross.png',
      'title': 'Warning Signs',
      'description': 'is set in n. p. for 50-100 m, outside n. p. for '
          '150-300 m, the sign can be set at a different '
          'distance, but the distance is specified in the table. 8.1.1 "Distance to the object". \n'
          'When approaching such an intersection, it '
          'is recommended to reduce speed to safe '
          'limits and to follow the rules of the intersections.',
    },
    {
      'imageThumb': 'assets/images/courses/single-track-railway.png',
      'image': 'assets/images/courses/single-track-railway.png',
      'title': 'Priority',
      'description': 'Priority',
    },
    {
      'imageThumb': 'assets/images/courses/cross-tram.png',
      'image': 'assets/images/courses/cross-tram.png',
      'title': 'Forbidden',
      'description': 'Forbidden',
    },
    {
      'imageThumb': 'assets/images/courses/cross.png',
      'image': 'assets/images/courses/cross.png',
      'title': 'Marks of special regulations',
      'description': 'Marks of special regulations',
    },
    {
      'imageThumb': 'assets/images/courses/light.png',
      'image': 'assets/images/courses/light.png',
      'title': 'Information signs',
      'description': 'Information signs',
    },
    {
      'imageThumb': 'assets/images/courses/circular-thumb.png',
      'image': 'assets/images/courses/circular.png',
      'title': 'Additional Information signs',
      'description': 'Additional Information signs',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopAppBar(),
              Text(
                widget.roadSignCategory['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: 6,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  Map<String, String> material = roadSigns[index];
                  return CourseContentItemCard(
                    image: Image.asset(
                      material['imageThumb']!,
                    ),
                    fontWeight: FontWeight.normal,
                    showSuffix: false,
                    fontSize: 16,
                    title: material['title']!,
                    onPressed: () {
                      // if (kDebugMode) {
                      //   print(material['title']);
                      //   print(material['description']);
                      // }
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: true, // User must tap button to dismiss
                        builder: (BuildContext context) {
                          // return CupertinoAlertDialog(
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                            contentPadding: EdgeInsets.zero,
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 8.0, right: 8),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(Icons.close),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    material['title']!,
                                    style: const TextStyle(
                                      color: Color(0xff21205A),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Image.asset(
                                    material['image']!,
                                    width: 127,
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
                                    child: Text(
                                      material['description']!,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        color: Color(0xff21205A),
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
