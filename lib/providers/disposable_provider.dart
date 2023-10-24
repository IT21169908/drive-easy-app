import 'package:flutter/foundation.dart';

abstract class DisposableProvider with ChangeNotifier {
  void disposeValues();
}
