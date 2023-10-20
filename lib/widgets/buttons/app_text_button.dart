part of '../widgets.g.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  const AppTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.padding,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: textStyle ??
                    TextStyle(
                      fontSize: fontSize ?? 18,
                      color: ThemeConsts.appPrimaryBlue,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
