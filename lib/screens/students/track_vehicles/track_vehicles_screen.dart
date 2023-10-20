import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/material.dart';

class TrackVehiclesScreen extends StatefulWidget {
  const TrackVehiclesScreen({super.key});

  @override
  State<TrackVehiclesScreen> createState() => _TrackVehiclesScreenState();
}

class _TrackVehiclesScreenState extends State<TrackVehiclesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopAppBar(),
              const SizedBox(height: 20),
              const ScreenTopBanner(
                title: 'Vehicle Tracking',
                assets: 'assets/images/tracking-vehicles.png',
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 4, right: 4, top: 15),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 1,
                  childAspectRatio: (MediaQuery.of(context).size.width / 2) / 60,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  children: const [
                    ButtonCardWide(
                      title: "Available Vehicles",
                      asset: "assets/images/available_vehicles.png",
                    ),
                    ButtonCardWide(
                      title: "Nearby Vehicles",
                      asset: "assets/images/nearby_vehicles.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
