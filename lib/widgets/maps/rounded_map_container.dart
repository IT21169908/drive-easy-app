part of '../widgets.g.dart';

class RoundedMapContainer extends StatefulWidget {
  const RoundedMapContainer({super.key});

  @override
  State<RoundedMapContainer> createState() => _RoundedMapContainerState();
}

class _RoundedMapContainerState extends State<RoundedMapContainer> {
  final Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition _userCurrentLocation = const CameraPosition(
    target: LatLng(6.927079, 79.861244), //Colombo, Sri Lanka
    zoom: 14.4746,
  );
  List<Marker> _markers = <Marker>[
    const Marker(
      markerId: MarkerId("app-position"),
      position: LatLng(6.927079, 79.861244), //Colombo, Sri Lanka
      infoWindow: InfoWindow(
        title: 'My Position',
      ),
    ),
  ];
  UserLocation? _userLocation;

  @override
  void initState() {
    super.initState();
    _userLocation = UserLocation(context: context);
    _userLocation!.getUserLastLocation().then((position) {
      _userCurrentLocation = CameraPosition(
        target: position != null ? LatLng(position.latitude, position.longitude) : const LatLng(6.927079, 79.861244), //Colombo, Sri Lanka
        zoom: 14.4746,
      );
      _markers = <Marker>[
        Marker(
          markerId: const MarkerId("my-position"),
          position: _userCurrentLocation.target,
          infoWindow: const InfoWindow(
            title: 'My Position',
          ),
        ),
      ];
      setState(() {});
    });
    _initLocationOnMap();
    _userLocation!.startPermissionCheckTimer(startAfter: 10, interval: 5);
  }

  void _initLocationOnMap() async {
    _userLocation!.getUserCurrentLocation().then((value) async {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId("my-current"),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: const InfoWindow(
            title: 'My Current Location',
          ),
        ),
      );
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      final GoogleMapController controller = await _googleMapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userLocation!.cancelPermissionCheckTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeConsts.appPrimaryLightYellow,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(32.0, 16.0, 16.0, 10.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'See Your Location',
                  style: TextStyle(
                    color: ThemeConsts.appPrimaryColorDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '123 Main Street, Your City',
                  style: TextStyle(
                    color: ThemeConsts.appPrimaryColorDark,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: _userCurrentLocation,
              markers: Set<Marker>.of(_markers),
              onMapCreated: (GoogleMapController controller) {
                _googleMapController.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}
