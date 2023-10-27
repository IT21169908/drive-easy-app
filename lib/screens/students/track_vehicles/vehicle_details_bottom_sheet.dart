import 'package:drive_easy_app/screens/students/track_vehicles/nearby_vehicles_screen.dart';
import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
                        SearchBar(
                          controller: _searchController,
                          elevation: const MaterialStatePropertyAll(0),
                          hintText: "Search",
                          padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 16.0, right: 4)),
                          constraints: const BoxConstraints(maxHeight: 50),
                          leading: const Icon(Icons.search),
                          trailing: <Widget>[
                            Tooltip(
                              message: 'Search location',
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.arrow_forward_ios_sharp),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 14.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 26.0,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: const NearbyVehiclesScreen(),
                                    withNavBar: true,
                                    pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                                  );
                                },
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
                                onPressed: () async {
                                  await PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: const NearbyVehiclesScreen(),
                                    withNavBar: true,
                                    pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                                  );
                                },
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
    );
  }
}
