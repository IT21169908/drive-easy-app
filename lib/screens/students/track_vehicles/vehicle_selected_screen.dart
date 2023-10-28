import 'package:drive_easy_app/screens/students/track_vehicles/available_vehicle_space_screen.dart';
import 'package:drive_easy_app/screens/students/track_vehicles/show_vehicle_location_screen.dart';
import 'package:drive_easy_app/screens/students/track_vehicles/widgets/vehicle_details_bottom_sheet.dart';
import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class VehicleSelectedScreen extends StatefulWidget {
  final String vehicleNo;

  const VehicleSelectedScreen({
    super.key,
    required this.vehicleNo,
  });

  @override
  State<VehicleSelectedScreen> createState() => _VehicleSelectedScreenState();
}

class _VehicleSelectedScreenState extends State<VehicleSelectedScreen> {
  final GlobalKey<ExpandableBottomSheetState> _bottomSheetKey = GlobalKey();

  List<dynamic> _availableVehicles = [];

  @override
  void initState() {
    _getNearbyVehicles();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getNearbyVehicles() {
    setState(() {
      _availableVehicles = [1, 2, 3, 4, 5];
    });
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    const TopAppBar(),
                    const SizedBox(height: 20),
                    ScreenTopBanner(
                      isNormalPage: true,
                      bannerMargin: EdgeInsets.zero,
                      imageWidth: 100,
                      assets: 'assets/images/track-vehicles/vehicle_drive.png',
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text(
                          'Vehicle - ${widget.vehicleNo}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/track-vehicles/vehicle_profile_cover_img.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 1,
                  childAspectRatio: (MediaQuery.of(context).size.width / 2) / 60,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  children: [
                    ButtonCardWide(
                      titleWidget: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maneesh',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Instructor',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      image: Container(
                        width: 75,
                        height: 75,
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
                            width: 75,
                            height: 75,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        // await PersistentNavBarNavigator.pushNewScreen(
                        //   context,
                        //   screen: const AvailableVehiclesScreen(),
                        //   withNavBar: true,
                        //   pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                        // );
                      },
                    ),
                    ButtonCardWide(
                      title: "Show Location",
                      asset: "assets/images/track-vehicles/show_location.png",
                      onPressed: () async {
                        await PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: ShowVehicleLocationScreen(
                            vehicleNo: widget.vehicleNo,
                          ),
                          withNavBar: true,
                          pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                        );
                      },
                    ),
                    ButtonCardWide(
                      title: "Available Space",
                      asset: "assets/images/track-vehicles/available_space.png",
                      onPressed: () async {
                        await PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: AvailableVehicleSpaceScreen(
                            vehicleNo: widget.vehicleNo,
                          ),
                          withNavBar: true,
                          pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                        );
                      },
                    ),
                    ButtonCardWide(
                      title: "Vehicle Details",
                      asset: "assets/images/track-vehicles/vehicle_drive_2.png",
                      onPressed: () async {
                        await PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: AvailableVehicleSpaceScreen(
                            vehicleNo: widget.vehicleNo,
                          ),
                          withNavBar: true,
                          pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
        expandableContent: const SizedBox(),
        animationDurationExtend: const Duration(milliseconds: 500),
        animationCurveExpand: Curves.easeIn,
      ),
    );
  }
}
