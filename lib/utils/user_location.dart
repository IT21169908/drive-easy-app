import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UserLocation {
  final BuildContext context;
  Timer? _permissionCheckTimer;

  UserLocation({required this.context});

  void startPermissionCheckTimer({required int startAfter, required int interval}) {
    Future.delayed(Duration(seconds: startAfter)).then((res) async {
      Duration checkInterval = Duration(seconds: interval);
      _permissionCheckTimer = Timer.periodic(checkInterval, (timer) {
        checkLocationServices().then((canServiceEnable) async {
          if (canServiceEnable) {
            _permissionCheckTimer?.cancel();
            await getUserCurrentLocation();
          } else if (!await Geolocator.isLocationServiceEnabled()) {
            startPermissionCheckTimer(startAfter: startAfter, interval: interval);
          }
        });
      });
    });
  }

  void cancelPermissionCheckTimer() {
    _permissionCheckTimer?.cancel();
  }

  Future<Position> getUserCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      await Geolocator.requestPermission().then((value) {}).onError((error, stackTrace) async {
        await Geolocator.requestPermission();
        log("UserLocation ERROR::: $error");
      });
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<bool> checkLocationServices() async {
    bool isServiceEnabled;
    bool? shouldOpenSettings;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      _permissionCheckTimer?.cancel();
      if (context.mounted) {
        shouldOpenSettings = await showDialog<bool>(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text('Location Services Disabled!'),
              content: const Text('Please enable location services to use this feature.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(false);
                  },
                ),
                TextButton(
                  child: const Text('Open Settings'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(true);
                  },
                ),
              ],
            );
          },
        );
      }
    }
    return shouldOpenSettings ?? false;
  }

  Future<Position?> getUserLastLocation() async {
    await Geolocator.requestPermission();
    return await Geolocator.getLastKnownPosition();
  }
}
