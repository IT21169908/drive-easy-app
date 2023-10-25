part of '../widgets.g.dart';

class CircularLoaderWidget {
  final BuildContext widgetContext;
  final Color? color;

  CircularLoaderWidget(this.widgetContext, {this.color = const Color(0xff007aff)}) {
    if (!Loader.isShown) {
      Loader.show(widgetContext, progressIndicator: CircularProgressIndicator(color: color));
    }
  }

  static void dismiss() {
    if (Loader.isShown) {
      Loader.hide();
    }
  }
}
