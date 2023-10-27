import 'package:flutter/material.dart';

class CourseMaterialItemCard extends StatelessWidget {
  const CourseMaterialItemCard({
    super.key,
    required this.onPressed,
    required this.image,
    required this.title,
    required this.subtitle,
    this.icon = Icons.arrow_forward_ios,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  });

  final Widget image;
  final String title;
  final String subtitle;
  final IconData? icon;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;

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
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            image,
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
