import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';

class NearbyVehiclesScreen extends StatefulWidget {
  const NearbyVehiclesScreen({super.key});

  @override
  State<NearbyVehiclesScreen> createState() => _NearbyVehiclesScreenState();
}

class _NearbyVehiclesScreenState extends State<NearbyVehiclesScreen> {
  final GlobalKey<ExpandableBottomSheetState> _bottomSheetKey = GlobalKey();
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
                  assets: 'assets/images/nearby_vehicles.png',
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      'Nearby Vehicles',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        expandableContent: Container(
          decoration: const BoxDecoration(
            color: ThemeConsts.appPrimaryColorLight,
            borderRadius: BorderRadius.all(Radius.circular(36)),
          ),
          margin: const EdgeInsets.only(top: 0, bottom: 15),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Container(
                height: 180, //header size
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
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_sharp),
                          SizedBox(width: 5.0),
                          Text(
                            'See Nearby Vehicles',
                            style: TextStyle(
                              color: ThemeConsts.appPrimaryColorDark,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Select your location...',
                        style: TextStyle(
                          color: ThemeConsts.appPrimaryColorDark,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _searchController,
                              validator: (term) => (term == null || term.isEmpty) ? "Please enter your location" : null,
                              decoration: InputDecoration(
                                labelText: "Search",
                                hintText: "Search ...",
                                prefixIcon: const Icon(Icons.search_rounded, size: 28),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: ThemeConsts.appPrimaryColorDark.withOpacity(0.3)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: ThemeConsts.appPrimaryBlue.withOpacity(0.3)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(color: ThemeConsts.appPrimaryColorDanger),
                                ),
                              ),
                            ),
                            const SizedBox(height: 14.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 26.0,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: ThemeConsts.appPrimaryBlue,
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    child: const Text("Device Location"),
                                  ),
                                ),
                                SizedBox(
                                  height: 26.0,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: ThemeConsts.appPrimaryLightYellow,
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    child: const Text(
                                      "Select",
                                      style: TextStyle(color: ThemeConsts.appPrimaryColorDark),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const MapContainer(),
              ),
            ],
          ),
        ),
        animationDurationExtend: const Duration(milliseconds: 500),
        animationCurveExpand: Curves.easeIn,
      ),
    );
  }
}
