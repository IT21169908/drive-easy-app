import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExamGridCard extends StatelessWidget {
  const ExamGridCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
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
        onPressed: () => log('Screen => exam grid'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/courses/exam-grid-img.svg",
              width: 180,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MCQ Exam 1',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF1C1D23),
                      fontSize: 15,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 18,
                        color: Color(0xff471EBA),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '250+ Questions',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xff5B5E6D),
                          fontSize: 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        size: 18,
                        color: Color(0xff471EBA),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '12 Min',
                        textAlign: TextAlign.left,
                        style: TextStyle(
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
