part of '../widgets.g.dart';

class AppToastWidget {
  final String message;
  final Toast? length;
  final ToastGravity? placement;
  final Color? bgColor;
  final Color? txtColor;

  AppToastWidget(
    this.message, {
    this.length = Toast.LENGTH_LONG,
    this.placement = ToastGravity.BOTTOM,
    this.bgColor,
    this.txtColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: placement,
      backgroundColor: bgColor,
      textColor: txtColor,
    );
  }
}
