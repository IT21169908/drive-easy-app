import 'package:drive_easy_app/screens/students/track_vehicles/widgets/vehicle_details_bottom_sheet.dart';
import 'package:drive_easy_app/screens/students/track_vehicles/vehicle_selected_screen.dart';
import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AvailableVehicleSpaceScreen extends StatefulWidget {
  final String vehicleNo;

  const AvailableVehicleSpaceScreen({
    super.key,
    required this.vehicleNo,
  });

  @override
  State<AvailableVehicleSpaceScreen> createState() => _AvailableVehicleSpaceScreenState();
}

class _AvailableVehicleSpaceScreenState extends State<AvailableVehicleSpaceScreen> {
  final GlobalKey<ExpandableBottomSheetState> _bottomSheetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showDialog() {
    CommonConfirmation.showConfirmationDialog(
      context,
      image: Image.asset('assets/images/do_you_want.png', width: 200),
      title: 'Do you want to join?',
      description: '"Are you ready to embark on your journey towards becoming a confident driver? Click ' "Yes" ' to start your driving lessons with us!"',
      firstButton: "Yes",
      secondButton: "Not Now",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableBottomSheet(
        key: _bottomSheetKey,
        enableToggle: true,
        background: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopAppBar(),
                const SizedBox(height: 20),
                ScreenTopBanner(
                  isNormalPage: true,
                  bannerMargin: EdgeInsets.zero,
                  imageWidth: 100,
                  assets: 'assets/images/track-vehicles/available_vehicles.png',
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Available Space',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Vehicle - ${widget.vehicleNo}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/track-vehicles/select_vehicles.png", width: 150),
                            const SizedBox(height: 5),
                            Text(
                              'See Available Space in Vehicle',
                              style: TextStyle(
                                color: ThemeConsts.appPrimaryColorDark.withOpacity(0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      width: double.infinity,
                      height: 36,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff4E74F9),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          _showDialog();
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
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(left: 4, right: 4, top: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            childAspectRatio: (MediaQuery.of(context).size.width / 2) / 180,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 25,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            children: [
                              VehicleSpaceCard(
                                isAvailable: false,
                                onPressed: () {
                                  if (false) _showDialog();
                                },
                              ),
                              VehicleSpaceCard(
                                isAvailable: false,
                                onPressed: () {
                                  if (false) _showDialog();
                                },
                              ),
                              VehicleSpaceCard(
                                isAvailable: true,
                                onPressed: () {
                                  if (true) _showDialog();
                                },
                              ),
                              VehicleSpaceCard(
                                isAvailable: true,
                                onPressed: () {
                                  if (true) _showDialog();
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
        expandableContent: const SizedBox(),
        animationDurationExtend: const Duration(milliseconds: 500),
        animationCurveExpand: Curves.easeIn,
      ),
    );
  }
}
