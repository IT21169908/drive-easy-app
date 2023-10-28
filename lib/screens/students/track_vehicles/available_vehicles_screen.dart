import 'package:drive_easy_app/screens/students/track_vehicles/widgets/vehicle_details_bottom_sheet.dart';
import 'package:drive_easy_app/screens/students/track_vehicles/vehicle_selected_screen.dart';
import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AvailableVehiclesScreen extends StatefulWidget {
  const AvailableVehiclesScreen({super.key});

  @override
  State<AvailableVehiclesScreen> createState() => _AvailableVehiclesScreenState();
}

class _AvailableVehiclesScreenState extends State<AvailableVehiclesScreen> {
  final GlobalKey<ExpandableBottomSheetState> _bottomSheetKey = GlobalKey();
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> _availableVehicles = [];

  @override
  void initState() {
    _getNearbyVehicles();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
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
                  imageWidth: 100,
                  assets: 'assets/images/track-vehicles/available_vehicles.png',
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      'Available Vehicles',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                _availableVehicles.isEmpty
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 40),
                              Image.asset("assets/images/track-vehicles/select_vehicles.png", width: 300),
                              const SizedBox(height: 5),
                              Text(
                                'See Available Vehicles Today',
                                style: TextStyle(
                                  color: ThemeConsts.appPrimaryColorDark.withOpacity(0.8),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 25),
                              const Text(
                                'Not Found',
                                style: TextStyle(
                                  color: ThemeConsts.appPrimaryColorDanger,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
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
                                    'See Available Vehicles Today',
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
                                  childAspectRatio: (MediaQuery.of(context).size.width / 2) / 280,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  children: _availableVehicles.map((e) {
                                    return VehicleCard(
                                      vehicleNo: "ABC 1234",
                                      vehicleCategory: "VAN",
                                      onPressed: () async {
                                        await PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: const VehicleSelectedScreen(vehicleNo: "ABC 1234"),
                                          withNavBar: true,
                                          pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                                        );
                                      },
                                    );
                                  }).toList(),
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
