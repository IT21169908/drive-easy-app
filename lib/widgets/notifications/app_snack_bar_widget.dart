part of '../widgets.g.dart';

class AppSnackBarWidget {
  final BuildContext context;
  final Color? bgColor;
  final SnackBarBehavior? behavior;
  final Duration? duration;
  final String message;
  final Widget? content;
  final String? actionTxt;
  final Color? actionTxtColor;
  final Function()? onPressed;

  const AppSnackBarWidget({
    required this.context,
    this.bgColor,
    this.behavior,
    this.duration,
    this.message = '',
    this.content,
    this.actionTxt,
    this.actionTxtColor,
    this.onPressed,
  });

  show({String message = '', Widget? content, Function()? onPressed}) {
    final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
    scaffold.removeCurrentSnackBar();
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: bgColor ?? const Color(0xffff4040),
        behavior: SnackBarBehavior.floating,
        duration: duration ?? const Duration(seconds: 5),
        content: content ?? Text(message),
        action: SnackBarAction(
          label: actionTxt ?? 'Ok',
          textColor: actionTxtColor ?? const Color(0xffffc734),
          onPressed: () {
            scaffold.hideCurrentSnackBar();
            if (onPressed != null) {
              onPressed;
            }
          },
        ),
      ),
    );
  }

  static removeCurrent(BuildContext context) {
    final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
    scaffold.removeCurrentSnackBar();
  }

  static hideCurrent(BuildContext context) {
    final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
    scaffold.hideCurrentSnackBar();
  }
}
