import 'dart:developer';

import 'package:flutter/material.dart';

class ExamGridCard extends StatelessWidget {
  const ExamGridCard({
    super.key,
    required this.asset,
    required this.title,
    required this.subtitle,
    required this.examDuration,
    this.onPressed,
  });

  final String asset;
  final String title;
  final String subtitle;
  final String examDuration;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(8, 4),
            blurRadius: 25,
            spreadRadius: 0,
            color: Color(0x15000000),
          )
        ],
        color: Colors.white,
      ),
      child: MaterialButton(
        onPressed: onPressed ?? () => log('Screen => exam grid'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              height: 100,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color(0xFF1C1D23),
                      fontSize: 15,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 18,
                        color: Color(0xff471EBA),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        subtitle,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Color(0xff5B5E6D),
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        size: 18,
                        color: Color(0xff471EBA),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        examDuration,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Color(0xff5B5E6D),
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
