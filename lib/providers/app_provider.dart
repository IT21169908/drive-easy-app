import 'package:drive_easy_app/providers/disposable_provider.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppProvider extends ChangeNotifier {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  PackageInfo getPackageInfo() => _packageInfo;

  void setPackageInfo() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) => _packageInfo = packageInfo);
  }

  static List<DisposableProvider> getDisposableProviders(BuildContext context) {
    return [];
  }

  static void disposeAllDisposableProviders(BuildContext context) {
    getDisposableProviders(context).forEach((disposableProvider) {
      disposableProvider.disposeValues();
    });
  }
}
