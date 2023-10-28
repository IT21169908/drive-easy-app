import 'package:drive_easy_app/screens/students/track_vehicles/widgets/vehicle_details_bottom_sheet.dart';
import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ShowVehicleLocationScreen extends StatefulWidget {
  final String vehicleNo;

  const ShowVehicleLocationScreen({
    super.key,
    required this.vehicleNo,
  });

  @override
  State<ShowVehicleLocationScreen> createState() => _ShowVehicleLocationScreenState();
}

class _ShowVehicleLocationScreenState extends State<ShowVehicleLocationScreen> {
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
        background: Column(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Show Location',
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
                ],
              ),
            ),
            MapContainer(
              mapHeight: MediaQuery.of(context).size.height - 260,
            ),
          ],
        ),
        expandableContent: const SizedBox(),
        animationDurationExtend: const Duration(milliseconds: 500),
        animationCurveExpand: Curves.easeIn,
      ),
    );
  }
}
