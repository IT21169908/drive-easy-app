import 'package:drive_easy_app/screens/students/track_vehicles/available_vehicles_screen.dart';
import 'package:drive_easy_app/screens/students/track_vehicles/widgets/select_location_bottom_sheet.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TrackVehiclesScreen extends StatefulWidget {
  const TrackVehiclesScreen({super.key});

  @override
  State<TrackVehiclesScreen> createState() => _TrackVehiclesScreenState();
}

class _TrackVehiclesScreenState extends State<TrackVehiclesScreen> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopAppBar(),
                const SizedBox(height: 20),
                const ScreenTopBanner(
                  isNormalPage: true,
                  bannerMargin: EdgeInsets.zero,
                  imageWidth: 110,
                  assets: 'assets/images/track-vehicles/tracking-vehicles.png',
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      'Vehicle Tracking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: const RoundedMapContainer(),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
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
                        title: "Available Vehicles",
                        asset: "assets/images/track-vehicles/available_vehicles.png",
                        onPressed: () async {
                          await PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const AvailableVehiclesScreen(),
                            withNavBar: true,
                            pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                          );
                        },
                      ),
                      ButtonCardWide(
                        title: "Nearby Vehicles",
                        asset: "assets/images/track-vehicles/nearby_vehicles.png",
                        onPressed: () {
                          setState(() {
                            _bottomSheetKey.currentState!.expand();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        expandableContent: const SelectLocationBottomSheet(),
        animationDurationExtend: const Duration(milliseconds: 500),
        animationCurveExpand: Curves.easeIn,
      ),
    );
  }
}
