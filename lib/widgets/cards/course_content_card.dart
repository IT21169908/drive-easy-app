import 'package:flutter/material.dart';

class CourseContentItemCard extends StatelessWidget {
  const CourseContentItemCard({
    super.key,
    required this.onPressed,
    required this.image,
    required this.title,
    this.icon = Icons.arrow_forward_ios,
    this.margin,
    this.showSuffix = true,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 18,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : assert(
          !showSuffix || mainAxisAlignment == MainAxisAlignment.start,
          'If showSuffix is true, you must set mainAxisAlignment to MainAxisAlignment.start.',
        );

  final Widget image;
  final String title;
  final IconData? icon;
  final EdgeInsetsGeometry? margin;
  final Function()? onPressed;
  final bool showSuffix;
  final FontWeight fontWeight;
  final double fontSize;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(255, 255, 255, 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.12),
            offset: Offset(0, 5),
            blurRadius: 21,
          ),
        ],
      ),
      child: MaterialButton(
        height: 75,
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            image,
            const SizedBox(width: 10),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
              ),
            ),
            if (showSuffix)
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    icon,
                    size: 15,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
