part of '../widgets.g.dart';

class MapContainer extends StatefulWidget {
  const MapContainer({super.key});

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
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
    _userLocation!.startPermissionCheckTimer(startAfter: 15, interval: 10);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 400,
          child: GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: _userCurrentLocation,
            markers: Set<Marker>.of(_markers),
            onMapCreated: (GoogleMapController controller) {
              _googleMapController.complete(controller);
            },
          ),
        )
      ],
    );
  }
}
