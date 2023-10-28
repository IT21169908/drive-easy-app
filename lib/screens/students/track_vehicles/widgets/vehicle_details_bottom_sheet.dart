import 'dart:developer';

import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class VehicleDetailsBottomSheet extends StatefulWidget {
  const VehicleDetailsBottomSheet({super.key});

  @override
  State<VehicleDetailsBottomSheet> createState() => _VehicleDetailsBottomSheetState();
}

class _VehicleDetailsBottomSheetState extends State<VehicleDetailsBottomSheet> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ThemeConsts.appPrimaryColorLight,
        borderRadius: BorderRadius.all(Radius.circular(36)),
      ),
      margin: const EdgeInsets.only(top: 0, bottom: 15),
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            height: 46, //header size
            decoration: BoxDecoration(
              color: ThemeConsts.appPrimaryColorLight,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
              boxShadow: [
                BoxShadow(
                  color: ThemeConsts.appPrimaryColorDark.withOpacity(0.1),
                  offset: const Offset(0, -4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 8),
                    width: 100,
                    height: 4,
                    decoration: BoxDecoration(
                      color: ThemeConsts.appPrimaryColorDark.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
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
                          image: AssetImage('assets/images/track-vehicles/vehicle_profile_cover_img.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 45),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Maneesh',
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
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () => launchUrl(Uri.parse("tel:0766171525")),
                                  child: const Icon(
                                    Icons.call,
                                    color: Colors.green,
                                    size: 32,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () => launchUrl(Uri.parse("sms:0766171525")),
                                  child: const Icon(
                                    Icons.mail,
                                    color: Colors.orangeAccent,
                                    size: 32,
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
          const SizedBox(height: 15),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 20),
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
                    const SizedBox(width: 5),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/location_icon.svg",
                          width: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Last Known Location",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    AppTextButton(
                      padding: const EdgeInsets.only(left: 18),
                      onPressed: () => log("Show in map"),
                      text: "Show in Map",
                      fontSize: 14,
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 5),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/car_face_icon.svg",
                              width: 36,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Vehicle Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 36),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 55),
                        Text(
                          "Vehicle Name: Toyota Corolla "
                          "\n License Plate: ABC 1234 "
                          "\n Year of Manufacture: 2022",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 5),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/user_group_icon.svg",
                              width: 36,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Passengers",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              // height: 25,
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.withOpacity(0.6),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(8, 4),
                                    blurRadius: 25,
                                    spreadRadius: 0,
                                    color: Color(0x15000000),
                                  )
                                ],
                              ),
                              child: const Text(
                                "2 out of 4 seats",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4E74F9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                CommonConfirmation.showConfirmationDialog(
                  context,
                  image: Image.asset('assets/images/do_you_want.png', width: 200),
                  title: 'Do you want to join?',
                  description: '"Are you ready to embark on your journey towards becoming a confident driver? Click ' "Yes" ' to start your driving lessons with us!"',
                  firstButton: "Yes",
                  secondButton: "Not Now",
                );
              },
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Request to Join ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(Icons.login_rounded, color: Colors.white)
                ],
              ),
            ),
          ),
          const SizedBox(height: 45),
        ],
      ),
    );
  }
}
