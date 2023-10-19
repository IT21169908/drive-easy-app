import 'package:flutter/material.dart';

class CourseContentItemCard extends StatelessWidget {
  const CourseContentItemCard({
    super.key,
    required this.image,
    required this.title,
    this.icon = Icons.arrow_forward_ios,
    this.margin,
  });

  final Widget image;
  final String title;
  final IconData? icon;
  final EdgeInsetsGeometry? margin;

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
        onPressed: () {},
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            image,
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
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
